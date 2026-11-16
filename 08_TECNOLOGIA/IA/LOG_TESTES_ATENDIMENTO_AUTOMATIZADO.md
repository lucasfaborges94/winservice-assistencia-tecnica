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
