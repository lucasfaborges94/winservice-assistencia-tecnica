param([string]$Output = $PSScriptRoot)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName PresentationCore,WindowsBase
$invariant = [Globalization.CultureInfo]::InvariantCulture
$pt = [Globalization.CultureInfo]::GetCultureInfo('pt-BR')
$navy = '#001439'
$amber = '#FFA700'
$paper = '#F7F9FC'
$muted = '#455773'
$lightMuted = '#BECDDF'
$mark = 'M0 0 H106 Q113 0 116 8 L181 143 L255 8 Q259 0 266 0 H303 Q311 0 315 8 L380 143 L444 23 Q458 0 490 0 H780 L736 80 Q733 85 725 85 H548 Q529 85 518 106 L390 325 Q386 332 378 332 H366 Q359 332 355 325 L280 164 L191 325 Q188 332 180 332 H170 Q164 332 161 325 Z M533 114 Q541 122 555 122 H666 C732 122 780 164 780 227 C780 286 731 332 666 332 H414 L460 248 H656 C670 248 680 240 680 227 C680 214 670 206 656 206 H544 Q513 206 491 194 Z'

function Brush([string]$Color) {
    return [Windows.Media.BrushConverter]::new().ConvertFromInvariantString($Color)
}

function Word([string]$Text, [string]$Font, [double]$Size) {
    return [Windows.Media.FormattedText]::new($Text,$pt,[Windows.FlowDirection]::LeftToRight,[Windows.Media.Typeface]::new($Font),$Size,[Windows.Media.Brushes]::Black,1)
}

function VectorWord([string]$Text, [string]$Font, [double]$Size, [double]$X, [double]$Y, [string]$Color) {
    $word = Word $Text $Font $Size
    $geometry = $word.BuildGeometry([Windows.Point]::new($X,$Y))
    $path = [Windows.Media.PathGeometry]::CreateFromGeometry($geometry).ToString($invariant)
    $path = [regex]::Replace($path,'^F[01]\s*','')
    $path = [regex]::Replace($path,'-?\d+\.\d+(?:[eE][-+]?\d+)?',{ param($m) ([double]::Parse($m.Value,$invariant)).ToString('0.##',$invariant) })
    return @{ Path = $path; Geometry = $geometry; Color = $Color; Width = $word.WidthIncludingTrailingWhitespace }
}

function ExportLogo([string]$Name, [bool]$Square, [bool]$Dark) {
    $tile = if ($Dark) { $amber } else { $navy }
    $symbol = if ($Dark) { $navy } else { $amber }
    $width = if ($Square) { 1000 } else { 880 }
    $height = if ($Square) { 1000 } else { 230 }
    $origin = if ($Square) { 0 } else { 20 }
    $side = if ($Square) { 1000 } else { 190 }
    $radius = if ($Square) { 150 } else { 34 }
    $scale = $side / 1000
    $markX = $origin + $side * 0.11
    $markY = $origin + $side * 0.334
    $title = if ($Square) { 'WS — monograma Winservice' } else { 'Winservice — Assistência Técnica' }
    $theme = if ($Dark) { 'Fundo escuro' } else { 'Fundo claro' }

    $lines = @(
        "<svg xmlns=`"http://www.w3.org/2000/svg`" viewBox=`"0 0 $width $height`" role=`"img`" aria-labelledby=`"logo-title logo-desc`">"
        "  <title id=`"logo-title`">$title</title>"
        "  <desc id=`"logo-desc`">$theme. Azul marinho e âmbar.</desc>"
        "  <rect x=`"$origin`" y=`"$origin`" width=`"$side`" height=`"$side`" rx=`"$radius`" fill=`"$tile`"/>"
        "  <path fill=`"$symbol`" transform=`"translate($($markX.ToString($invariant)) $($markY.ToString($invariant))) scale($($scale.ToString($invariant)))`" d=`"$mark`"/>"
    )
    $visual = [Windows.Media.DrawingVisual]::new()
    $drawing = $visual.RenderOpen()
    $drawing.DrawRoundedRectangle((Brush $tile),$null,[Windows.Rect]::new($origin,$origin,$side,$side),$radius,$radius)
    $drawing.PushTransform([Windows.Media.TranslateTransform]::new($markX,$markY))
    $drawing.PushTransform([Windows.Media.ScaleTransform]::new($scale,$scale))
    $drawing.DrawGeometry((Brush $symbol),$null,[Windows.Media.Geometry]::Parse($mark))
    $drawing.Pop()
    $drawing.Pop()

    if (-not $Square) {
        $nameColor = if ($Dark) { $paper } else { $navy }
        $winColor = if ($Dark) { $amber } else { $navy }
        $tagColor = if ($Dark) { $lightMuted } else { $muted }
        $win = VectorWord 'WIN' 'Arial Black' 90 245 35 $winColor
        $service = VectorWord 'SERVICE' 'Arial' 90 (245 + $win.Width + 9) 35 $nameColor
        $tagline = VectorWord 'ASSISTÊNCIA TÉCNICA' 'Segoe UI Semibold' 32 249 141 $tagColor
        foreach ($word in @($win,$service,$tagline)) {
            $lines += "  <path fill=`"$($word.Color)`" fill-rule=`"nonzero`" d=`"$($word.Path)`"/>"
            $drawing.DrawGeometry((Brush $word.Color),$null,$word.Geometry)
        }
    }
    $drawing.Close()
    $lines += '</svg>'
    $target = Join-Path $Output $Name
    [IO.File]::WriteAllLines("$target.svg",$lines,[Text.UTF8Encoding]::new($false))
    $rasterScale = if ($Square) { 1 } else { 2 }
    $bitmap = [Windows.Media.Imaging.RenderTargetBitmap]::new($width * $rasterScale,$height * $rasterScale,96 * $rasterScale,96 * $rasterScale,[Windows.Media.PixelFormats]::Pbgra32)
    $bitmap.Render($visual)
    $encoder = [Windows.Media.Imaging.PngBitmapEncoder]::new()
    $encoder.Frames.Add([Windows.Media.Imaging.BitmapFrame]::Create($bitmap))
    $stream = [IO.File]::Create("$target.png")
    try { $encoder.Save($stream) } finally { $stream.Dispose() }
}

New-Item -ItemType Directory -Path (Join-Path $Output 'logos') -Force | Out-Null
ExportLogo 'logos/logo-horizontal-claro' $false $false
ExportLogo 'logos/logo-horizontal-escuro' $false $true
ExportLogo 'logos/logo-quadrado-claro' $true $false
ExportLogo 'logos/logo-quadrado-escuro' $true $true
