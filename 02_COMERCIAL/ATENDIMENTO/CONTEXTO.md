# CONTEXTO — Atendimento comercial Winservice

**Status:** Registro contextual em elaboração
**Versão:** 0.1
**Data:** 14/11/2026

## Situação
A direção iniciou o desenho de automação para novos clientes, começando por qualificação, condições da visita de orçamento e agendamento. O processo atual e os dados mínimos foram descritos verbalmente e registrados em `PROCESSO_ATENDIMENTO_INICIAL.md`.

O [catálogo versionado](CATALOGO_EQUIPAMENTOS.json) contém a carga inicial da Winservice. A fonte operacional do MVP será o Supabase com publicação e acesso por empresa. A disponibilidade por categoria segue o [cadastro de equipamentos](CADASTRO_EQUIPAMENTOS_ATENDIDOS.md).

## Próximos passos
Detalhar a matriz de atendimento e cobrança por equipamento, marca e região, e posteriormente especificar a máquina de estados e as skills. A Isa já qualifica na inbox 17 e coleta endereço completo, dia e turno em `AGENDAMENTO` antes de encaminhar à equipe. Consulte o [processo de atendimento inicial](PROCESSO_ATENDIMENTO_INICIAL.md) para a regra vigente desta etapa.

## Skills da Isa

O [manifesto](skills/isa.json) define a composição da Isa por etapa e referencia os módulos de tom, fontes, qualificação e agendamento. Edite os arquivos `SKILL.md` no GitHub. Um push na `main` aciona a leitura do manifesto e das skills na mesma revisão, valida o conjunto e publica no Supabase. O n8n mantém uma cópia ativa do catálogo. Uma reconciliação horária consulta o Supabase e verifica a fonte no GitHub para recuperar avisos perdidos.

O [sincronizador](https://workflows.winservicers.com/workflow/EFzxii10K4kmm39i) pode ser executado manualmente para conferir a publicação. O [atendimento](https://workflows.winservicers.com/workflow/xKLAexEfJxATiHDC) compõe as instruções conforme a etapa persistida. Alterações ao formato de saída ou às transições de estado exigem compatibilidade com o workflow. Durante o agendamento, opções completas são encaminhadas juntas à equipe e registradas com datas e turnos correspondentes.
