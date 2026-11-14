# GUIA DE USO DO REPOSITÓRIO — Winservice

**Status:** Vigente  
**Versão:** 1.1  
**Aprovador:** Direção  
**Aprovação original:** 14/11/2026  
**Revisão:** 14/11/2026  
**Repositório:** `lucasfaborges94/winservice-assistencia-tecnica`  
**Branch oficial:** `main`

## Finalidade e fontes
O GitHub é a fonte institucional oficial e versionada. As fontes do projeto ChatGPT são cópias de consulta, não sincronizadas automaticamente. Em divergências, conferir a versão vigente no GitHub.

Os **três documentos centrais estáveis** são `/AGENTES.md`, `/00_INSTITUCIONAL/REGRAS_DA_EMPRESA.md` e `/01_GOVERNANCA/GUIA_USO_REPOSITORIO.md`. Suas cópias devem ser anexadas às fontes do projeto ChatGPT. Quando alterados no GitHub, avisar que os anexos precisam ser atualizados manualmente.

Os arquivos `CONTEXTO.md` são **dinâmicos** e devem ser mantidos no GitHub, não nas fontes estáticas do projeto.

## Arquivos estruturais
- `AGENTES.md`: instruções do agente válidas no diretório e em seus descendentes.
- `CONTEXTO.md`: resumo contextual da área, objetivos, estado atual, decisões relevantes e referências às fontes oficiais.
- Arquivos temáticos: políticas, POPs, planos, relatórios, decisões e registros.

Na raiz, `AGENTES.md` é global e `CONTEXTO.md` apresenta o panorama institucional. Criar ambos em novos diretórios de trabalho, salvo exceção justificada. Adaptar diretórios existentes progressivamente, sem gerar arquivos vazios ou redundantes.

## Consulta inteligente e hierárquica
Em todas as solicitações, considerar os três documentos centrais, usando suas cópias anexadas quando acessíveis e atualizadas. Não exigir releitura integral nem chamadas redundantes quando o conteúdo já estiver efetivamente disponível.

Consultar `/CONTEXTO.md` quando precisar conhecer a situação atual da empresa, retomar projetos, analisar decisões ou confirmar informações institucionais.

Para trabalhar em `02_COMERCIAL/ATENDIMENTO/`, consultar conforme pertinência:
1. Os três documentos centrais.
2. `/CONTEXTO.md`, se necessário ao assunto.
3. `/02_COMERCIAL/AGENTES.md` e `/02_COMERCIAL/CONTEXTO.md`, quando existirem.
4. `/02_COMERCIAL/ATENDIMENTO/AGENTES.md` e `/02_COMERCIAL/ATENDIMENTO/CONTEXTO.md`, quando existirem.
5. Documentos especializados necessários.

Regras locais detalham regras superiores, mas não as revogam. Em conflito, sinalizar a inconsistência antes de aplicar a regra conflitante. Não afirmar consulta sem acesso efetivo.

## Atualização de contextos
1. Registrar alterações na fonte primária (decisão, processo, política ou registro).
2. Atualizar o `CONTEXTO.md` local se a mudança afetar seu resumo.
3. Avaliar cada ancestral, de baixo para cima, até a raiz; atualizar apenas os resumos materialmente afetados.
4. Uma mudança em ancestral não provoca atualização automática de descendentes. Verificar impactos e registrar pendências de revisão quando necessário.
5. Contextos resumem e apontam para fontes; não duplicam integralmente outros documentos.
6. Avaliar atualizações após decisões e avanços relevantes, não apenas ao final da conversa; evitar commits sem mudança substantiva.

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
Este guia rege a organização e a atuação do agente desde sua aprovação. `01_GOVERNANCA/GOVERNANCA_DOCUMENTAL.md` permanece **minuta não aprovada** e pode subsidiar futura revisão, mas não deve ser tratado como política vigente. Havendo divergência, prevalece este guia até decisão expressa da direção.

## Histórico
- 1.0 — 14/11/2026: guia aprovado pela direção.
- 1.1 — 14/11/2026: separação entre três documentos estáveis anexados e contextos dinâmicos consultados no GitHub.
