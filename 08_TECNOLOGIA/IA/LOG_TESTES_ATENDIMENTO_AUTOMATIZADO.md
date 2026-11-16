# Log de testes — atendimento automatizado

**Data:** 16/11/2026 (UTC)
**Workflow:** `xKLAexEfJxATiHDC` — Winservice | Atendimento piloto V2 | Homologação segura
**Status:** HOMOLOGAÇÃO PARCIAL — NÃO PRONTO PARA PRODUÇÃO
**Escopo:** testes com pin data (dados sintéticos) no n8n, sem chamadas reais aos serviços externos para as ramificações testadas.

## Alteração antecedente
- Criado nó `Carregar configuração restrita de homologação` e conectada a leitura Chatwoot.
- URL de leitura usa `accountId` e `conversationId` fornecidos pelo nó validado.
- Workflow permanece inativo; transferências automáticas desabilitadas e desconectadas.
- Plano de implantação: `PLANO_CONFIGURACAO_DINAMICA_ATENDIMENTO.md`.

## Testes executados e evidências
| Caso | Execução n8n | Resultado observado | Evidência |
|---|---|---|---|
| Deduplicação: mensagem já processada | 9948481 | PASSOU | `Bloquear mensagem duplicada` produziu zero itens |
| Whitelist: contato divergente | 9948484 | PASSOU | `Validar whitelist e montar histórico` produziu zero itens |
| Mensagem de saída/atendente | 9948485 | PASSOU | `Validar whitelist e montar histórico` produziu zero itens |
| Estado aguardando equipe | 9948486 | PASSOU | `Bloquear mensagem duplicada` produziu zero itens |

Todas as execuções acima retornaram `status=success` e foram verificadas pela consulta de dados dos nós. Dados da mensagem de teste foram sintéticos; nenhum número de telefone é publicado neste log.

## Limites da evidência
- O retorno `success` não basta isoladamente; os itens de saída dos nós de bloqueio foram inspecionados.
- As credenciais e operações de rede/banco foram substituídas por pin data; estes testes **não validam** Chatwoot real, OpenAI real, SQL real, RLS, escrita, concorrência ou entrega.
- O fluxo de aprovação humana não foi exercitado, nem houve autorização para transferência real.
- Não houve teste de recuperação/reimplementação do DRP.
- O fluxo ainda usa IDs fixos em SQL e em outros nós; a parametrização está incompleta.

## Pendências bloqueantes para prontidão
1. Completar parametrização dos nós e queries com verificação de tenant e whitelist em cada etapa.
2. Executar cenários positivos com resposta de IA simulada e SQL pinado; validar conteúdo da resposta, extração e estado.
3. Testar integração real com escopo de homologação aprovado e sem envio externo, incluindo deduplicação e reconciliação de estado.
4. Revisar migrations, constraints, políticas RLS e concorrência/idempotência.
5. Validar comportamento sob erro de Chatwoot, OpenAI e Supabase, timeouts e recuperação.
6. Exportar versão reproduzível e executar restauração isolada conforme DRP.
7. Obter autorização específica antes de ativar gatilhos, envio ao WhatsApp ou transferência real.

## Conclusão
**APROVADO PARCIALMENTE PARA CONTINUAR HOMOLOGAÇÃO MANUAL RESTRITA. NÃO APROVADO PARA PRODUÇÃO.**

## Continuação autorizada — integração real restrita e correção (16/11/2026 UTC)
- Foram parametrizadas as queries dos nós `Consultar mensagem processada`, `Persistir estado e deduplicar` e `Consultar estado real do encaminhamento` para consumir tenant, conversa e contato da configuração restritiva do piloto. Os demais nós ainda precisam de revisão.
- **Execução manual 9948497: FALHOU.** O nó `Consultar mensagem processada` retornou `ExpressionError: invalid syntax` após a primeira tentativa de parametrização. Nenhuma etapa de persistência foi executada nessa tentativa.
- Corrigida a expressão: o SQL passou a usar interpolações nativas do n8n nos campos, mantendo os valores provenientes de configuração interna validada, sem entrada direta do cliente.
- **Execução manual 9948498: PASSOU.** Consultou Chatwoot e banco na ramificação de leitura/deduplicação, sem alcançar a persistência; terminou com `status=success`. Não comprova processamento positivo nem escrita no Supabase.
- O workflow segue **inativo**, sem transferências automáticas conectadas. Não foram ativados gatilhos nem envio ao WhatsApp.
- **Risco residual:** o número autorizado ainda está fixo no nó de whitelist e a configuração está codificada no workflow. Falta parametrização integral, isolamento e testes de escrita, falhas e concorrência.

## Continuação — centralização da whitelist e regressão real
- No n8n, o nó `Validar whitelist e montar histórico` passou a ler `contactId`, `conversationId`, `inboxId`, `approvedRecipient` e `mode` da configuração validada, eliminando duplicação de valores no código do validador.
- O validador passou a exigir explicitamente `mode=PREVIEW_ONLY`, `outboundEnabled=false` e `assignmentEnabled=false` antes de produzir itens. A configuração segue restrita ao piloto, sem permitir novos contatos.
- **Execução manual real 9948511: PASSOU** (`status=success`), incluindo nós de whitelist, consulta de mensagem processada e deduplicação. Não alcançou etapa de gravação.
- Sem ativação do workflow, sem mensagens externas e sem transferência automática.
- **Pendência:** ainda faltam teste positivo de qualificação com IA, escrita SQL, concorrência, tratamento de falhas, DRP e ativação controlada.

## Homologação funcional positiva — testes simulados (16/11/2026 UTC)
- **Execução 9948516 — PASSOU:** quatro campos presentes (equipamento, marca, defeito, bairro); nó `Estruturar qualificação e sinalizar humano` produziu `status=AGUARDANDO_EQUIPE`, `handoffRequested=true`, zero campos pendentes. A resposta ficou apenas em prévia (`BLOCKED_PREVIEW_ONLY`).
- **Execução 9948517 — PASSOU:** bairro ausente; nó produziu `status=QUALIFICACAO`, `handoffRequested=false`, `camposPendentes=['bairro']` e pergunta curta sobre bairro. A resposta ficou apenas em prévia.
- Em ambos os testes, a codificação base64 do payload foi produzida, sem escrita real; o modelo foi simulado (saída fixa) e as integrações foram pinadas.
- **Atenção:** o retorno `status=success` dos testes não valida o SQL real, nem a qualidade do modelo OpenAI com entrada livre, nem a atribuição no Chatwoot.
- **Critério de conclusão ainda não atendido:** persistência real positiva, idempotência concorrente, falhas e restauração isolada. Não ativar produção.

## Teste transacional real de deduplicação — Supabase (16/11/2026 UTC)
- Inspecionadas quatro tabelas do schema `atendimento_piloto`: `qualificacoes`, `mensagens_processadas`, `encaminhamentos_humanos`, `auditoria_encaminhamentos`; todas com RLS habilitado.
- Verificados índices únicos por `tenant_key, canal, conversa_externa_id` nas qualificações/encaminhamentos e por `tenant_key, canal, conversa_externa_id, mensagem_externa_id` em mensagens processadas.
- **PASSOU:** transação SQL de homologação com duas inserções idênticas e `ON CONFLICT DO NOTHING` retornou `total_deduplicado=1`.
- **PASSOU:** `ROLLBACK` executado na mesma transação; consulta posterior retornou `residuos=0`. Nenhum dado de teste foi mantido.
- **Limite:** teste sequencial não equivale a teste de concorrência entre transações nem exercita o SQL completo de persistência do n8n. Não valida autorização efetiva de RLS por papel.
- O workflow segue inativo e sem envio externo.

## Publicação controlada — modo sombra (16/11/2026 UTC)
- Autorização do responsável: iniciar produção em modo teste, lapidando e reforçando progressivamente.
- Workflow n8n `xKLAexEfJxATiHDC` **publicado/ativo**, versão `d054637e-d6c9-4a59-8876-addca3ad3ce8`.
- Novo `scheduleTrigger` a cada 5 minutos, conectado exclusivamente ao nó de configuração restrita. O disparo manual permanece disponível para diagnóstico.
- Restrição mantida: somente tenant, conversa, inbox e contato explicitamente permitidos; `PREVIEW_ONLY`, `outboundEnabled=false`, `assignmentEnabled=false`. Não envia mensagens nem transfere atendimentos.
- Execuções de sucesso e erro configuradas para serem salvas, timeout de 180 s.
- **Estado de liberação:** produção técnica em modo sombra; **não** produção de atendimento automatizado para clientes. Necessário validar as primeiras execuções agendadas e implementar integração segura de resposta/transferência antes de expandir o escopo.
- Rollback imediato: despublicar o workflow `xKLAexEfJxATiHDC`; nenhuma alteração no fluxo de ingestão Chatwoot existente.

## Piloto ponta a ponta sem envio de mensagens (16/11/2026 UTC)
- A pedido do responsável, habilitado o caminho de atribuição de equipe no Chatwoot, mantendo **nenhum nó de envio de mensagem ao cliente conectado**; `outboundEnabled=false`, resposta apenas em `Prévia sem envio WhatsApp`.
- Configuração restrita alterada para `assignmentEnabled=true`; whitelist continua exigindo tenant, inbox, conversa, contato e número do piloto e modo `PREVIEW_ONLY`.
- Nó `Preparar transferência em simulação` agora valida autorização e encaminha para `Transferir automaticamente no Chatwoot (desativado)`, que foi habilitado; este segue para confirmação e registro de auditoria no Supabase, agora habilitado.
- **Execução manual 9948556: PASSOU** na ramificação de leitura e deduplicação; não houve mensagem nova elegível e, portanto, **não exercitou** IA, persistência, atribuição nem auditoria.
- Workflow publicado ativo na versão `23eb2ce9-9de3-46e5-adbd-83805ee1cd3c`; gatilho a cada cinco minutos.
- **Atenção:** habilitação de caminho não é prova de transferência ponta a ponta. A atribuição real poderá ocorrer somente se a conversa de teste atingir estado elegível. Não ampliar whitelist sem validar resultado e corrigir falhas.
- **Rollback:** despublicar workflow ou remover conexão `Preparar transferência em simulação` → `Transferir automaticamente no Chatwoot (desativado)` e republicar.

## Integração operacional por webhook — 16/11/2026 UTC
- Workflow `xKLAexEfJxATiHDC` publicado versão `4c3286ea-e35b-4145-9b1d-f0644a3c4a6c`: webhook `POST /webhook/winservice/atendimento-v2`, configuração dinâmica por evento Chatwoot, consulta à API do Chatwoot, validação de conversa/contato/telefone/inbox, IA, deduplicação SQL, envio de mensagem pública Chatwoot após gravação, consulta do encaminhamento e atribuição dinâmica para equipe 1.
- Restrição de **conversa fixa removida para eventos webhook**; inbox 17 e conta 1 permanecem como escopo. Eventos que não são `message_created` incoming ou sem campos válidos são descartados. Polling de conversa fixa removido. O gatilho manual ainda aponta à conversa de diagnóstico 1152.
- Workflow de ingestão `qUZG9HfLePlbHxyf` publicado versão `6a664146-d5a5-4bc2-a307-9d2134689e57`; ramificação paralela encaminha payload original Chatwoot ao webhook de atendimento, com falha isolada para não impedir ingestão existente.
- Teste de rejeição de evento outgoing, execução real webhook `9948623`: **PASSOU**, filtrado no nó de configuração, sem envio.
- Consulta às execuções históricas da ingestão mostrou falhas anteriores de embedding OpenAI devido a `N8N_BLOCK_ENV_ACCESS_IN_NODE` na expressão `$env.OPENAI_API_KEY`; esse problema preexistente não foi corrigido e a ramificação nova é independente.
- **Não verificado ainda:** mensagem incoming real no inbox 17 após publicação, inferência real, INSERT/UPSERT em Supabase, resposta efetivamente entregue ao WhatsApp, atribuição e auditoria reais. Não declarar homologação ponta a ponta concluída.
- Rollback: despublicar o atendimento V2 e remover a ramificação `Webhook Chatwoot` → `Encaminhar evento ao atendimento V2` na ingestão; republicar ingestão.

## Correção da falha real 9948714 — 16/11/2026 UTC
- Execução webhook `9948714` processou mensagem real da conversa 1153 pelo Chatwoot, passou pela IA e falhou em `Persistir estado e deduplicar` com `chk_piloto_contato_autorizado`.
- Causa-raiz: restrições SQL de homologação limitavam conversas a 1149/1152 e contato 1089; também havia duas restrições análogas na tabela de encaminhamentos.
- Migração aplicada com sucesso `atendimento_v2_permitir_conversas_dinamicas_inbox_validado`: remove três restrições fixas do piloto e adiciona `chk_v2_identidade_valida` e `chk_v2_encaminhamento_valido` para exigir IDs positivos e telefone preenchido. Validação de inbox 17, conta, contato e mensagem continua no workflow.
- Não houve resposta enviada nesta execução: falha SQL ocorreu antes do nó de saída.
- **Pendente:** nova mensagem incoming para comprovar persistência, envio de resposta e transferência. A execução antiga não foi reproduzida automaticamente.

## Ajuste de comunicação — 16/11/2026 UTC
- Workflow `xKLAexEfJxATiHDC` publicado versão `bbddd1ea-300b-4b3c-bef8-257706d1216d`.
- Prompt do agente atualizado para atendimento cordial, saudação inicial, acolhimento do problema, uma pergunta por vez, sem repetição de saudações e sem promessas comerciais.
- Saudação por período do dia somente quando houver horário local confiável; sem horário disponível, usar `Olá!`.
- Alteração apenas de prompt, sem mudar regras de extração ou banco. A nova versão precisa ser avaliada nas próximas mensagens reais.
- Diretrizes devem ser extraídas posteriormente para documentação reutilizável/Skill de atendimento, sem criar Skill separada só para tom.

## Correção de intenção conversacional — 16/11/2026 UTC
- Execução `9948896`, conversa 1153, mensagem 39403: cliente perguntou `Vocês concertão?`; agente respondeu com repetição da pergunta sobre marca e ignorou dúvida direta.
- Causa: prompt priorizava campo obrigatório ausente e não instruía responder à última pergunta do cliente antes de qualificar.
- Atualizado e publicado prompt no workflow `xKLAexEfJxATiHDC`, versão `e82a564d-6b7e-47c5-a5f5-84f789c28e5c`, para priorizar perguntas, interpretar erros de digitação, lidar com objeções e evitar afirmações não verificadas sobre cobertura, preço ou disponibilidade.
- A alteração não reprocessa a mensagem anterior; validar em nova mensagem real.

## Conhecimento comercial para resposta sobre secadora Brastemp — 16/11/2026 UTC
- Consultados `02_COMERCIAL/ATENDIMENTO/CATALOGO_EQUIPAMENTOS.json` e `CADASTRO_EQUIPAMENTOS_ATENDIDOS.md`: secadora de roupas consta `ativa`; exclusões vazias; purificadores `em_ativacao`.
- Corrigido prompt do workflow `xKLAexEfJxATiHDC` e publicada versão `4aaa2d22-212f-4858-9716-642552713441` para confirmar que a Winservice trabalha com conserto de secadoras, inclusive Brastemp, sem prometer cobertura de modelo, região, peças, valor ou agenda.
- Correção imediata com snapshot textual das categorias. **Débito técnico:** implementar consulta dinâmica à versão vigente do catálogo no Supabase por tenant, conforme documentação; não considerar a integração de catálogo pronta.
- Pendente validar resposta em mensagem real após publicação.

## Catálogo comercial no agente — 16/11/2026 UTC
- Fonte: `02_COMERCIAL/ATENDIMENTO/CATALOGO_EQUIPAMENTOS.json`. Secadora de roupas é categoria ativa.
- Publicada versão `4aaa2d22-212f-4858-9716-642552713441` do workflow `xKLAexEfJxATiHDC`, instruindo a IA a confirmar conserto de secadoras Brastemp, sem prometer agenda, peças, preço ou cobertura regional.
- Catálogo foi incluído como fotografia no prompt. **Ainda não existe consulta dinâmica à revisão operacional do Supabase por empresa**. Validar resposta com nova mensagem real.

## Implantação do catálogo operacional por tenant — 16/11/2026 UTC
- Previsto em `02_COMERCIAL/ATENDIMENTO/CADASTRO_EQUIPAMENTOS_ATENDIDOS.md` (anteriormente não implantado).
- Migração Supabase `catalogo_operacional_atendimento_por_tenant`: tabela `atendimento_piloto.catalogos_equipamentos(tenant_key PK,catalogo jsonb,revisao,atualizado_em)`; carga inicial idempotente de `CATALOGO_EQUIPAMENTOS.json` somente no tenant `winservice-homologacao`.
- Validação SQL: revisão 1, 9 categorias, `secadora_de_roupas` ativa.
- Workflow `xKLAexEfJxATiHDC`, versão publicada `e6bbb861-2320-49c6-8029-5038a9885100`: novo nó PostgreSQL `Consultar catálogo operacional por empresa` entre `Bloquear mensagem duplicada` e `Qualificar e preparar resposta`; fornece JSON e revisão ao agente; prompt não fixa mais a lista de equipamentos.
- Fallback sem catálogo: IA não deve afirmar cobertura e deve pedir validação humana.
- **Pendente:** teste real ponta a ponta da nova versão; controle de acesso administrativo, publicação/versionamento de revisões, gestão de marcas, exclusões, regiões e disponibilidade técnica continuam como etapas separadas. A tabela não é uma interface administrativa nem sincroniza automaticamente alterações do arquivo GitHub.
