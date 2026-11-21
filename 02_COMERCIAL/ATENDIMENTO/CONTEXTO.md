# CONTEXTO — Atendimento comercial Winservice

**Status:** Registro contextual em elaboração
**Versão:** 0.2
**Data:** 21/11/2026

## Situação
A direção iniciou o desenho de automação para novos clientes, começando por qualificação, condições da visita de orçamento e agendamento. O processo atual e os dados mínimos foram descritos verbalmente e registrados em `PROCESSO_ATENDIMENTO_INICIAL.md`.

O [catálogo versionado](CATALOGO_EQUIPAMENTOS.json) contém a carga inicial da Winservice. A fonte operacional do MVP será o Supabase com publicação e acesso por empresa. A disponibilidade por categoria segue o [cadastro de equipamentos](CADASTRO_EQUIPAMENTOS_ATENDIDOS.md).

## Próximos passos
Detalhar a matriz de atendimento e cobrança por equipamento, marca e região, e posteriormente especificar a máquina de estados e as skills. A Isa já qualifica na inbox 17 e coleta endereço completo, dia e turno em `AGENDAMENTO` antes de encaminhar à equipe. Consulte o [processo de atendimento inicial](PROCESSO_ATENDIMENTO_INICIAL.md) para a regra vigente desta etapa.

## Skills da Isa

O [manifesto](skills/isa.json) define a composição da Isa por etapa e referencia os módulos de tom, fontes, qualificação e agendamento.

### Fluxo de mudança e publicação

Decidimos que as mudanças nas skills da Isa serão conduzidas nesta conversa: depois de alinharmos e aprovarmos uma alteração, o assistente atualiza os arquivos necessários no GitHub e publica a mudança na branch oficial `main`. O usuário não precisa fazer manualmente cada edição ou commit. Um commit em uma branch de trabalho, por si só, não inicia a sincronização; a publicação só ocorre quando a alteração chega à `main` (por merge ou publicação direta autorizada).

A publicação lê o manifesto e as skills da mesma revisão, valida o conjunto e registra a versão no Supabase. O Supabase notifica o n8n, que atualiza sua cópia ativa do catálogo na Data Table. A Isa utiliza a versão ativa na próxima execução. Se o aviso falhar, a reconciliação horária confere o estado e recupera a publicação; até a confirmação da atualização, a versão anterior permanece ativa.

Depois de cada publicação, o assistente verifica o commit/revisão no GitHub, a versão publicada no Supabase e a atualização do catálogo no n8n. Só deve informar que a sincronização terminou quando houver confirmação dessas etapas; em caso de falha ou divergência, informa o ponto pendente e mantém como referência a versão ativa anterior até a correção.

Mudanças que afetem formato de saída, transições de estado ou esquema/workflow do n8n precisam ser alinhadas antes da publicação. O [sincronizador](https://workflows.winservicers.com/workflow/EFzxii10K4kmm39i) pode ser executado manualmente para conferir a publicação. O [atendimento](https://workflows.winservicers.com/workflow/xKLAexEfJxATiHDC) compõe as instruções conforme a etapa persistida. Durante o agendamento, opções completas são encaminhadas juntas à equipe e registradas com datas e turnos correspondentes.
