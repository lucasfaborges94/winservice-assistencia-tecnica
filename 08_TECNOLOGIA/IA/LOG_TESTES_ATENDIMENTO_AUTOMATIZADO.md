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
