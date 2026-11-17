# Auditoria contínua de atendimentos reais — IA e equipe humana

**Status:** Registro de auditoria em andamento; não é política comercial aprovada.
**Início:** 17/11/2026.
**Escopo:** Amostras de conversas reais do Chatwoot, cruzadas com execuções do n8n e, quando acessível, desfechos comerciais.
**Restrição:** Somente leitura dos sistemas operacionais; não enviar mensagens, não alterar workflows nem registros de clientes durante auditoria.

## Objetivo
Construir inteligência institucional de atendimento: avaliar a qualidade da Iza (IA) e de atendentes humanos, localizar falhas que prejudicam a conversão, mapear transferências, elaborar propostas de scripts e aprimoramentos do skill de atendimento, sempre com validação da direção antes de mudar comportamento em produção.

## Amostra inicial informada pela direção
IDs de conversa Chatwoot: **1163, 1167, 1179, 1178, 1177, 1175, 1173, 1160, 1174, 1171, 1168**.
**Atenção:** IDs transcritos de fala; conferir correspondência com o Chatwoot antes de fechar a amostra.

## Critérios de atribuição
- **Iza:** identidade informada pela direção como atendente IA; confirmar, quando possível, com ID de mensagem e execução do nó `Responder cliente Chatwoot`.
- **Felipe:** identidade informada pela direção como atendente humano; conferir autor no Chatwoot.
- **Não identificado:** ausência de evidência suficiente; não deduzir que toda mensagem sem execução n8n foi escrita por humano.
- Registrar timestamps com fuso `America/Sao_Paulo`, ID da conversa, ID da mensagem, origem, texto ou síntese minimizada, contexto e evidência.
- Distinguir mensagem **criada no Chatwoot** de **entregue no WhatsApp**.

## Evidência técnica confirmada até aqui
Workflow n8n: `xKLAexEfJxATiHDC` — `Winservice | Atendimento | Produção`.
Conversa **1179**: execuções **9961916**, **9961955** e **9962001** atingiram o nó `Responder cliente Chatwoot` e retornaram mensagens públicas de saída do Chatwoot com IDs **39999**, **40002** e **40007**, respectivamente. A execução **9962001** indicou modo `LIVE` e envio habilitado; não houve erro registrado no nó de envio. Isso comprova criação de mensagens de saída pela automação nessa conversa, **não** entrega final no WhatsApp. Demais conversas e transcrições completas ainda **não auditadas**.

## Ficha padronizada por conversa
Para cada ID, registrar:
1. Período, canal, contexto do pedido, equipamento/marca/defeito/bairro quando disponíveis, sem expor dados pessoais desnecessários.
2. Linha do tempo completa: horário, autor (Iza, Felipe, cliente, não identificado), ID da mensagem, conteúdo relevante e evento de transferência.
3. Tempo até primeira resposta, pausas, retomadas, tempo até intervenção humana e continuidade após transferência.
4. Qualificação: dados solicitados, perguntas repetidas, informações incorretas, objeções e oportunidades de conversão.
5. Conformidade com regras comerciais vigentes, clareza, empatia, precisão, promessas e alucinações.
6. Desfecho **confirmado**: agendou, não agendou, aguardando, perdeu, sem resposta, ou desconhecido; não confundir ausência de agendamento com perda comprovada.
7. Falhas por gravidade, evidências, causa provável (separada de fato), impacto potencial, proposta de correção e responsável sugerido.
8. Recomendações de script/skill, hipótese de melhoria, métrica de validação e status de aprovação.

## Indicadores de amostra
Número de conversas auditadas; proporção de mensagens IA/humano; taxa de primeira resposta; tempo de resposta; percentual de qualificação completa; taxa de agendamento quando desfecho conhecido; transferências; retrabalho; falhas críticas; oportunidades de conversão perdidas **com evidência**. Registrar denominadores e casos sem informação.

## Backlog da amostra
| Conversa | Transcrição completa | Autoria validada | Desfecho | Situação |
|---|---|---|---|---|
| 1163 | Bloqueada: sem leitura integral do Chatwoot | Pendente | Não verificado | Primeiro caso em análise; aguardando fonte integral |
| 1167 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1179 | Pendente | 3 mensagens IA confirmadas; restante pendente | Não verificado | Auditoria em aberto |
| 1178 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1177 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1175 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1173 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1160 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1174 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1171 | Pendente | Pendente | Não verificado | Auditoria em aberto |
| 1168 | Pendente | Pendente | Não verificado | Auditoria em aberto |

## Limitações e próximos passos
O conector n8n disponível permite consultar execuções, mas **não fornece diretamente a transcrição integral do Chatwoot**. Antes de classificar a qualidade das conversas, obter leitura completa e autorizada pelo Chatwoot ou fonte de dados confiável, e cruzar com n8n. Não inventar falhas, taxas ou scripts baseados em transcrições não lidas. Scripts e mudanças no skill serão **propostas**, não alterações automáticas em produção.

## Histórico
- 17/11/2026 — Direção solicitou auditoria contínua de amostra real, abrangendo IA e humanos, com registro versionado para melhoria de qualidade e conversão. Criado registro inicial e evidências já confirmadas.

## Execução sequencial aprovada pela direção — 17/11/2026
Auditar **uma conversa por vez**, começando pelo ID **1163**; registrar evidências e atualizar o contexto; comunicar conclusão; **aguardar OK expresso** antes do próximo ID. Após a amostra, ampliar o levantamento para todos os atendimentos do dia 17/11/2026 na inbox 17, sem duplicações. Acesso atual permite leitura de execuções n8n, mas não leitura integral de mensagens do Chatwoot; o Supabase conectado não apresenta tabela de histórico Chatwoot na listagem consultada. **Não classificar o caso 1163 como auditado até obter a transcrição integral.**
