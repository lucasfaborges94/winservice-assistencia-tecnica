# Identidade visual Winservice

Versão 1.0 · 14/11/2026 · Marketing  
Direção visual selecionada: monograma **WS** · Assinatura: **Assistência Técnica**

[Abrir o guia visual](index.html) · [Variáveis CSS](winservice.css) · [Tokens JSON](tokens.json)

## Logos

| Uso | Fundo claro | Fundo escuro |
|---|---|---|
| Horizontal, para sites, propostas, apresentações e assinaturas | [SVG](logos/logo-horizontal-claro.svg) · [PNG](logos/logo-horizontal-claro.png) | [SVG](logos/logo-horizontal-escuro.svg) · [PNG](logos/logo-horizontal-escuro.png) |
| Quadrado, para perfis, ícones e avatares | [SVG](logos/logo-quadrado-claro.svg) · [PNG](logos/logo-quadrado-claro.png) | [SVG](logos/logo-quadrado-escuro.svg) · [PNG](logos/logo-quadrado-escuro.png) |

Use o SVG em interfaces e arquivos editáveis. A assinatura horizontal em SVG tem texto convertido em contornos e abre com o mesmo desenho em máquinas sem as fontes. Use os PNGs transparentes em documentos, redes sociais e ferramentas que não aceitam SVG. Exporte o quadrado com fundo sólido do próprio tema se a plataforma exigir um arquivo sem transparência.

Reserve ao redor da marca pelo menos ¼ do lado do bloco do monograma, contado a partir da borda visível. Para a assinatura completa, use largura mínima recomendada de 250 px na tela ou 55 mm no impresso. Em áreas menores, use o quadrado, a partir de 32 px ou 8 mm. Preserve a proporção e as cores. Sobre fotos, coloque a marca em uma superfície sólida.

## Ícones

A pasta [icones/](icones/) reúne 15 SVGs em grade de 24 px com traço de 1,8. Inclui modos de tema, atendimento, água, localização, comunicação e estados. Consulte o [manual dos ícones](icones/README.md) e a galeria no guia. Em interfaces, aplique os arquivos como máscara CSS para herdar a cor do tema; mantenha um rótulo para ações.

## Paleta

**Azul marinho #001439**, **âmbar #FFA700** e **branco frio #F7F9FC** são as cores de marca. Use marinho para a identidade e títulos no tema claro. Reserve o âmbar para o monograma, ações principais e detalhes. O rótulo do botão âmbar é sempre azul marinho.

| Papel | Claro | Escuro |
|---|---|---|
| Fundo da página | `#F7F9FC` | `#09172C` |
| Superfície de cartões | `#FFFFFF` | `#112441` |
| Fundo alternado | `#EDF2F8` | `#19334F` |
| Texto principal | `#001439` | `#F7F9FC` |
| Texto secundário | `#455773` | `#BECDDF` |
| Bordas decorativas | `#D0DAE7` | `#344C67` |
| Bordas de controles | `#687A92` | `#8199B4` |
| Ação primária | `#FFA700` | `#FFA700` |
| Ação ao passar o mouse | `#F29400` | `#FFC04D` |
| Links | `#174785` | `#9CCAFF` |
| Foco do teclado | `#174785` | `#FFC04D` |
| Sucesso | `#155B3D` | `#83E0B4` |
| Aviso | `#784600` | `#FFD085` |
| Erro | `#9F253B` | `#FFAAB5` |

No fundo base, o contraste do texto principal é 17,18:1 no claro e 17,01:1 no escuro. O rótulo marinho sobre o botão âmbar tem 9,30:1. Use sublinhado para identificar links em texto e acompanhe cores de estado com rótulos, como “Concluído” ou “Pendente”. O âmbar sobre branco tem contraste baixo para texto.

## Tipografia, escala e acabamento

- Use Inter em interfaces e materiais digitais. Segoe UI ou Arial são alternativas para arquivos do Office. A assinatura do logo usa contornos próprios.
- Corpo digital de 16 px com entrelinha de 1,55. Use 14 px para notas, 20 px para subtítulos, 24 a 32 px para títulos e 32 a 56 px para capas. Em propostas e impressos, comece com corpo de 10 a 11 pt e títulos entre 18 e 24 pt.
- Use 400 no corpo, 600 nos rótulos, 700 nos títulos e 800 nos destaques. Em textos corridos, escreva “Winservice”. Use “Assistência Técnica” na assinatura.
- Use intervalos de 4, 8, 12, 16, 24, 32, 48 e 64 px. Prefira raio de 8 px em botões e campos, e 16 px em cartões. Controles digitais devem ter área acionável de pelo menos 44 px.
- Use fotografia de equipamento e atendimento com iluminação natural. Identifique imagens ilustrativas quando houver chance de serem confundidas com registros da equipe ou de clientes.

## Aplicação

| Material | Aplicação sugerida |
|---|---|
| Sites e landing pages | Logo horizontal no cabeçalho, um botão âmbar para a ação principal e links sublinhados no corpo. Aplique `winservice.css` e escolha os tokens por função. |
| Propostas, ordens de serviço e documentos | Tema claro, logo horizontal no cabeçalho, texto marinho e âmbar pontual. Use os códigos HEX em documentos digitais e peça prova de cor se houver impressão comercial. |
| Slides e PDFs | Tema escuro em capas ou aberturas. Tema claro para tabelas e páginas longas. Use uma versão de logo por superfície. |
| Perfis, ícones e redes sociais | Monograma quadrado no avatar. Use a assinatura horizontal em peças de divulgação com espaço para leitura. |
| Painéis e aplicações | Adote os tokens de fundo, superfície, texto, borda e estado. Preserve foco visível no teclado e acrescente texto aos estados. |

O CSS segue o tema do sistema por padrão. Defina `data-theme="light"` ou `data-theme="dark"` no elemento `html` para fixar a preferência. O JSON registra a mesma paleta em formato portátil. O guia visual reúne amostras, botões, campos e estados para os dois temas.

## Origem e manutenção

O monograma WS escolhido foi explorado com GPT Imagens a partir do [logo anterior](https://winservicers.com/assets/logo.png) e refinado em vetor. O kit está publicado em https://winservicers.com/identidade/. Os arquivos desta pasta são a referência para novos materiais. Registre alterações de cores e geometria nesta pasta para manter a marca consistente entre canais.
