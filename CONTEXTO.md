# CONTEXTO — Visão institucional da Winservice

**Status:** Vigente como registro de contexto, sujeito a atualização factual  
**Versão:** 1.2  
**Validação da estrutura:** Direção, 14/11/2026

## Identidade e objetivo
Winservice — Assistência Técnica, empresa de serviços em eletrodomésticos. O objetivo de longo prazo é desenvolver uma operação rentável, profissional, escalável e menos dependente do fundador, com ambição de ultrapassar 100 colaboradores.

## Time de agentes de IA

A Winservice vai criar um time de agentes de IA autônomos. A Isa é o ponto de partida para experimentar a composição por skills reutilizáveis, começando com tom de atendimento, fontes, qualificação e agendamento. A iniciativa orienta as decisões conforme as [diretrizes globais](AGENTES.md).

O fluxo decidido para as skills da Isa é manter o GitHub como fonte versionada: após uma mudança ser alinhada nesta conversa, o assistente atualiza os arquivos e publica na `main`. A publicação sincroniza a versão no Supabase e atualiza o catálogo ativo do n8n; a conclusão deve ser confirmada nos três pontos. O procedimento está detalhado no [contexto do atendimento](02_COMERCIAL/ATENDIMENTO/CONTEXTO.md).

## Informações a confirmar
Registros anteriores mencionam lavadoras, lava e seca e refrigeradores, bem como Porto Alegre e Canoas. Essas referências são contexto histórico e devem ser confirmadas antes de decisões comerciais ou operacionais. Equipe, capacidade, faturamento, margens, ferramentas e metas quantitativas ainda exigem diagnóstico.

## Governança do conhecimento
Os três documentos normativos centrais vigentes são `AGENTES.md`, `00_INSTITUCIONAL/REGRAS_DA_EMPRESA.md` e `01_GOVERNANCA/GUIA_USO_REPOSITORIO.md`. Eles podem ser anexados às fontes do projeto ChatGPT. Este `CONTEXTO.md` é dinâmico e deve ser consultado diretamente no GitHub conforme necessidade, não anexado como fonte estática.

A norma `01_GOVERNANCA/GOVERNANCA_DOCUMENTAL.md` continua como minuta em revisão pendente e não foi aprovada por inferência.

## Organização
O repositório adota áreas temáticas: institucional, governança, comercial, marketing, operacional, financeiro, jurídico, recursos humanos, tecnologia e arquivo. Pastas e arquivos locais serão criados conforme a necessidade, sem presumir que toda a árvore proposta já existe.

## Registros relacionados
Existem documentos de planejamento e relacionamento com agência de marketing. Eles não devem ser interpretados como contratação concluída sem comprovação.

## Manutenção
Este arquivo é um resumo transversal. Alterações locais só devem chegar aqui quando relevantes para a visão geral; fatos detalhados permanecem nas fontes especializadas.

## Histórico
- 1.0 — 14/11/2026: estrutura de contexto aprovada, com lacunas factuais explicitadas.
- 1.1 — 14/11/2026: esclarecido caráter dinâmico e consulta sob demanda.
- 1.2 — 21/11/2026: registrado o fluxo de publicação e sincronização das skills da Isa.

## Continuidade e recuperação corporativa
- Aprovada e vigente a [`ADR-001 — Continuidade, recuperação de desastre e reimplementação integral`](01_GOVERNANCA/ADR_001_CONTINUIDADE_RECUPERACAO_E_REIMPLEMENTACAO.md), acompanhada de modelos de DRP e de instruções para agentes de IA. **Aprovação expressa da Direção em 16/11/2026**; DRPs específicos dependem de implementação e validação.
