# Cadastro dinâmico de equipamentos atendidos — Winservice

**Status:** Definições da direção e proposta técnica ainda não implantada
**Data:** 14/11/2026
**Escopo:** Consulta de disponibilidade de categorias de equipamentos no atendimento automatizado

## Definições informadas pela direção
- A relação de tipos de equipamentos atendidos deve ser consultável e administrável, não fixa nas instruções da IA.
- A disponibilidade de atendimento pode depender de técnicos próprios ou parceiros e mudar com o tempo.
- Purificadores de água passam a integrar os equipamentos atendidos, inicialmente mediante parceria com técnico especializado.
- Se a parceria terminar e não houver capacidade de atendimento, a categoria deverá poder ser desativada sem apagar o histórico.
- Lava e seca já é uma categoria confirmada no processo comercial.
- A elegibilidade efetiva também depende de marca, solicitação e região, conforme PROCESSO_ATENDIMENTO_INICIAL.md.

## Lista fechada de equipamentos — decisão da direção de 15/11/2026
O [catálogo de equipamentos](CATALOGO_EQUIPAMENTOS.json) é a fonte da lista de equipamentos atendidos e da lista de exclusões. A lista `atendidos` é fechada. Quando o equipamento estiver identificado com clareza e não constar dessa lista, a Winservice não atende o pedido de conserto.

A lista `exclusoes` é aplicada primeiro. Ela retira subtipos específicos de uma categoria atendida. Por exemplo, se a categoria secadora de roupas for atendida e houver uma exclusão publicada para secadora de varal, a exclusão prevalece no caso específico. A lista negativa começa vazia, sem converter esse exemplo em uma exclusão aprovada.

Se faltar identificar o equipamento ou houver ambiguidade, peça esclarecimento. Se a versão publicada do catálogo estiver indisponível, encaminhe para validação humana. Faça a consulta pela cópia versionada da regra publicada. Uma mudança de disponibilidade nunca inclui um equipamento fora da lista e não habilita agendamento por si só.

O purificador de água pertence ao escopo atendido e mantém a disponibilidade `em_ativacao` até confirmação da operação com o parceiro. A lista fechada não altera cobertura regional, preços ou disponibilidade de agenda.

## Proposta de implementação (não aprovada nem implantada)
Criar cadastro no banco operacional (por exemplo Supabase), com campos: id, nome da categoria, status (ativo, suspenso, inativo), modalidade de execução (equipe própria/parceiro), referência de responsável, regiões cobertas, observações, data de atualização e motivo de suspensão. O vínculo com técnicos e a disponibilidade efetiva devem ser modelados separadamente, permitindo mais de um profissional por categoria.

O agente consulta esse cadastro por tool a cada nova qualificação, antes de prometer atendimento. Categoria suspensa/inativa não deve ser oferecida para novos agendamentos. Atendimentos já abertos devem manter seu histórico e ser tratados conforme regras operacionais a definir. Não excluir registros históricos para representar interrupção da parceria.

As regras de cobrança/isenção permanecem em matriz separada por categoria, marca e região. O status da categoria, sozinho, não determina preço nem cobertura.

## Regra adicional confirmada pela direção — indisponibilidade temporária
- O cadastro deve permitir marcar uma categoria como **temporariamente indisponível**, informando a **previsão de retorno**.
- Exemplo: ausência de técnico por férias ou doença. A IA deve informar ao cliente a indisponibilidade atual e a previsão registrada.
- O atendimento poderá ser oferecido para uma data futura, mas **somente se houver horário efetivamente disponível e confirmado**; a previsão de retorno não equivale a uma reserva.
- A previsão poderá mudar; quando não houver data confiável, a IA não deve inventar uma.
- A categoria permanece cadastrada, com histórico preservado, e pode voltar ao status ativo.
- Proposta técnica: guardar status, previsão de retorno, motivo interno, data de revisão e última atualização; verificar a agenda antes de confirmar qualquer visita. Não divulgar detalhes pessoais do afastamento do técnico ao cliente.

## Regra confirmada — reativação manual com solicitação automática (14/11/2026)
- **Somente uma pessoa autorizada pode reativar** o atendimento de uma categoria. A IA e a automação não podem mudar o status para ativo por conta própria.
- Ao atingir ou ultrapassar a previsão de retorno, a automação altera o status de temporariamente indisponível para **reativação pendente** e gera automaticamente uma solicitação/notificação de confirmação à equipe responsável.
- Se um cliente solicitar atendimento enquanto a categoria estiver em reativação pendente, a IA deve gerar ou reforçar a solicitação de confirmação, sem duplicar notificações em excesso, e informar que a disponibilidade está sendo verificada. Não prometer agendamento antes da confirmação e da consulta à agenda.
- Após confirmação humana, o sistema pode registrar o status **ativo**, o responsável e a data/hora da decisão. Se a indisponibilidade continuar, a equipe deve atualizar a previsão e manter/suspender o atendimento.
- Proposta técnica: workflow agendado no n8n para detectar vencimento da previsão; evento de demanda do cliente para reforçar notificação; tarefa de confirmação persistida com deduplicação, responsável, histórico e lembretes; ação humana autenticada para confirmar.
- A notificação é automática; **a ativação é manual**. A regra está documentada, mas nenhum workflow, alerta ou integração foi implementado.

## Canal de confirmação definido pela direção — notificações internas
- As solicitações automáticas de confirmação de reativação serão exibidas **dentro do sistema integrado à IA**, em uma **área de notificações por usuário**.
- A notificação deve ser direcionada ao usuário responsável e permitir que ele acesse a solicitação pendente para decidir manualmente pela reativação ou pela prorrogação da indisponibilidade.
- A decisão e seu autor devem ficar registrados; a IA não pode confirmar por conta própria.
- Proposta técnica ainda não implantada: notificação persistente vinculada a usuário, categoria e tarefa de reativação; estados de leitura e resolução, com prevenção de duplicatas. A interface e as permissões específicas serão definidas na implementação.

## Pendências
- Confirmar quando a operação de purificadores estará efetivamente disponível para agendamento.
- Manter disponibilidade, cobertura regional e condições comerciais de cada categoria nas fontes aprovadas.
- Aprovar estados e regras de ativação/desativação e o responsável pela manutenção do cadastro.
- Definir integração com o banco, ferramentas e workflow do n8n, além de permissões e interface da central de notificações.
