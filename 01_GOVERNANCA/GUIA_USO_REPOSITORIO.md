# GUIA DE USO DO REPOSITÓRIO — Winservice

**Status:** Em elaboração — proposta sujeita à aprovação  
**Versão:** 0.1  
**Repositório:** `lucasfaborges94/winservice-assistencia-tecnica`  
**Branch principal:** `main`

## Finalidade
Preservar o conhecimento institucional, regras, decisões, processos e histórico da Winservice. O GitHub é a fonte oficial versionada. Arquivos anexados ao projeto ChatGPT são cópias de consulta e exigem atualização manual após mudanças relevantes.

## Arquivos-padrão por diretório
- `AGENTES.md`: instruções operacionais do agente para aquele escopo.
- `CONTEXTO.md`: resumo do estado, objetivos, decisões e documentos importantes daquele escopo.
- Outros arquivos: políticas, POPs, registros, planos, indicadores e evidências, conforme necessidade.

Na raiz, `AGENTES.md` e `CONTEXTO.md` são globais. Diretórios novos de trabalho devem receber ambos, salvo justificativa explícita. Diretórios existentes podem ser adequados progressivamente.

## Leitura hierárquica
Para atuar em `02_COMERCIAL/ATENDIMENTO/`, ler, quando existentes:
1. `/AGENTES.md` e `/CONTEXTO.md`;
2. `/02_COMERCIAL/AGENTES.md` e `/02_COMERCIAL/CONTEXTO.md`;
3. `/02_COMERCIAL/ATENDIMENTO/AGENTES.md` e `/02_COMERCIAL/ATENDIMENTO/CONTEXTO.md`;
4. documentos específicos necessários.

Regras locais detalham, mas não anulam, regras globais. Contradições exigem esclarecimento ou revisão formal.

## Atualização hierárquica de contexto
1. Alterar primeiro o documento que é a fonte principal do fato ou decisão.
2. Atualizar o `CONTEXTO.md` do diretório correspondente quando o resumo for afetado.
3. Subir a árvore, avaliando cada `CONTEXTO.md` ancestral. Atualizar apenas os que precisam refletir a mudança em nível resumido.
4. Não atualizar automaticamente `CONTEXTO.md` descendentes quando um ancestral mudar. Se houver possível impacto, registrar pendência de revisão nos descendentes afetados.
5. Não duplicar detalhes em todos os níveis; usar sínteses e caminhos relativos para as fontes.

## Regras de escrita
- Consultar o arquivo existente e sua versão atual antes de editar.
- Respeitar os status documentais; um commit não significa aprovação.
- Manter títulos claros, escopo, status, versão e histórico quando apropriado.
- Não declarar implantação de processo apenas porque foi documentado.
- Não incluir senhas, tokens ou dados pessoais desnecessários.
- Preferir mudanças pequenas, rastreáveis e mensagens de commit descritivas.
- Submeter documentos sensíveis ou mudanças de política à direção para aprovação.
- Não alterar a governança existente silenciosamente; enquanto `GOVERNANCA_DOCUMENTAL.md` estiver pendente de aprovação, sinalizar conflitos e solicitar decisão.

## Fontes do projeto ChatGPT
Manter anexadas cópias dos documentos centrais de baixa volatilidade. Incluir versão ou data de atualização; após alteração no GitHub, atualizar manualmente os anexos. Em divergências, confirmar a versão oficial no repositório.

## Critérios para consulta
A leitura dos documentos centrais é a regra para trabalhos substantivos; não reler arquivos irrelevantes nem afirmar acesso inexistente. Para alterações, verificar o conteúdo e o estado atual no GitHub.
