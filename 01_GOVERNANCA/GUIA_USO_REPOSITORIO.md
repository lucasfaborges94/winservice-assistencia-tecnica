# GUIA DE USO DO REPOSITÓRIO — Winservice

**Status:** Vigente  
**Versão:** 1.0  
**Aprovador:** Direção  
**Data de aprovação e vigência:** 14/11/2026  
**Repositório:** `lucasfaborges94/winservice-assistencia-tecnica`  
**Branch oficial:** `main`

## Finalidade e fontes
O GitHub é a fonte institucional oficial, versionada. As fontes do projeto ChatGPT são cópias de consulta, não sincronizadas automaticamente. Ao atualizar documentos centrais no GitHub, sinalizar que as cópias anexadas devem ser substituídas. Em divergência, conferir a versão vigente no GitHub.

## Arquivos estruturais
- `AGENTES.md`: instruções do agente válidas no diretório e em seus descendentes.
- `CONTEXTO.md`: resumo contextual da área, seus objetivos, estado atual, decisões relevantes e referências para documentos-fonte.
- Arquivos temáticos: políticas, POPs, planos, relatórios, decisões e registros.

Na raiz, ambos os arquivos são globais. Criar os dois em novos diretórios de trabalho, salvo exceção justificada. Adaptar diretórios existentes progressivamente, sem gerar arquivos vazios ou redundantes.

## Consulta hierárquica
Para trabalhar em `02_COMERCIAL/ATENDIMENTO/`, considerar nesta ordem:
1. Os quatro documentos centrais aprovados.
2. `/AGENTES.md` e `/CONTEXTO.md`.
3. `/02_COMERCIAL/AGENTES.md` e `/02_COMERCIAL/CONTEXTO.md`, se existirem.
4. `/02_COMERCIAL/ATENDIMENTO/AGENTES.md` e `/02_COMERCIAL/ATENDIMENTO/CONTEXTO.md`, se existirem.
5. Documentos especializados necessários.

Regras locais detalham regras superiores, mas não as revogam. Em conflito, interromper a aplicação da regra conflitante e pedir revisão ou esclarecimento.

## Atualização de contextos
1. Registrar alterações na fonte primária (decisão, processo, política ou registro).
2. Atualizar o `CONTEXTO.md` local se a mudança afetar seu resumo.
3. Avaliar cada ancestral, de baixo para cima, até a raiz; atualizar apenas os resumos materialmente afetados.
4. Uma mudança em ancestral não provoca atualização automática de descendentes. Verificar impacto e registrar pendência de revisão quando necessário.
5. Contextos resumem e apontam para fontes; não duplicam integralmente o conteúdo de outros documentos.

## Controle de mudanças
- Ler a versão atual do arquivo antes de editar; evitar sobrescrever alterações recentes.
- Documentos controlados devem indicar status, versão, escopo e aprovação quando aplicável.
- A publicação no GitHub não representa aprovação. Somente autorização expressa da direção ou delegado pode aprovar.
- Distinguir `Aprovado` de `Vigente`, quando houver data de entrada em vigor diferente.
- Usar commits claros, preferir mudanças pequenas e preservar histórico.
- Alterações de política, exclusões e decisões sensíveis exigem autorização explícita.
- Não guardar segredos, tokens ou dados pessoais desnecessários.
- O histórico do Git não substitui aprovação formal nem plano de backup.

## Relação com a norma documental anterior
Este guia rege a organização e a atuação do agente desde sua aprovação. `01_GOVERNANCA/GOVERNANCA_DOCUMENTAL.md` permanece **minuta não aprovada** e pode subsidiar uma futura revisão, mas não deve ser tratado como política vigente. Havendo divergência, prevalece este guia até decisão expressa da direção.

## Anexos do ChatGPT
Anexar os quatro documentos centrais como fontes do projeto, mantendo nome e versão. Sempre que forem alterados, atualizar manualmente as cópias. A consulta obrigatória pode usar essas fontes quando acessíveis; antes de editar ou decidir sobre versões atuais, conferir o GitHub. Não declarar consulta se não houver acesso real.

## Histórico
- 1.0 — 14/11/2026: guia aprovado e harmonizado com as regras globais do agente.
