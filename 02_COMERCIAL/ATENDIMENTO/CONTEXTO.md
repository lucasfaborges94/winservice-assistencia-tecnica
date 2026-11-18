# CONTEXTO — Atendimento comercial Winservice

**Status:** Registro contextual em elaboração
**Versão:** 0.1
**Data:** 14/11/2026

## Situação
A direção iniciou o desenho de automação para novos clientes, começando por qualificação, condições da visita de orçamento e agendamento. O processo atual e os dados mínimos foram descritos verbalmente e registrados em `PROCESSO_ATENDIMENTO_INICIAL.md`.

O [catálogo versionado](CATALOGO_EQUIPAMENTOS.json) contém a carga inicial da Winservice. A fonte operacional do MVP será o Supabase com publicação e acesso por empresa. A disponibilidade por categoria segue o [cadastro de equipamentos](CADASTRO_EQUIPAMENTOS_ATENDIDOS.md).

## Próximos passos
Detalhar a matriz de atendimento e cobrança por equipamento, marca e região, e posteriormente especificar a máquina de estados e as skills. A Isa já qualifica na inbox 17 e coleta endereço completo, dia e turno em `AGENDAMENTO` antes de encaminhar à equipe. Consulte o [processo de atendimento inicial](PROCESSO_ATENDIMENTO_INICIAL.md) para a regra vigente desta etapa.

