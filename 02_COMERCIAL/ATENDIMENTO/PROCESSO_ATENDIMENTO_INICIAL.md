# Processo de atendimento inicial — Winservice

**Status:** Registro de definições informadas pela direção; detalhamento e implantação pendentes
**Versão:** 0.1
**Data:** 14/11/2026
**Escopo:** Novos contatos, qualificação, condições da visita de orçamento e agendamento
**Origem:** Definições fornecidas pela direção em conversa em 14/11/2026

## Definições confirmadas pela direção
1. O atendimento começa verificando se a Winservice atende a solicitação.
2. A qualificação requer: tipo de equipamento, marca, relato do defeito ou solicitação e bairro/região.
3. O endereço completo é desejável, mas **não é obrigatório para qualificar**; pode ser coletado no agendamento.
4. A decisão de cobrar ou não o orçamento considera o **tipo de equipamento, a marca e a região**. Critérios detalhados e valores ainda não foram definidos neste registro.
5. Após a qualificação, apresentar as condições da visita/orçamento aplicáveis ao caso.
6. Se o cliente aceitar as condições, oferecer o agendamento e combinar o horário da visita para orçamento.

## Fluxo de referência (proposta técnica, não implantada)
Coleta de informações → verificação de atendimento e qualificação → determinação das condições de orçamento → apresentação das condições → aceite → agendamento da visita de orçamento.

Possíveis saídas a modelar: solicitação não atendida, informações insuficientes, recusa, ausência de resposta e encaminhamento humano. Essas saídas são **propostas de modelagem**, não regras operacionais aprovadas.

## Pendências para formalização
- Relação de tipos de equipamento e marcas atendidos e suas exceções.
- Regiões atendidas e política de deslocamento.
- Matriz que determina cobrança ou isenção do orçamento por equipamento, marca e região; valores e condições exatos.
- Dados necessários para confirmar agendamento, disponibilidade e política de remarcação/cancelamento.
- Regras para encaminhamento humano e tratamento de solicitações simultâneas.
- Aprovação do desenho da máquina de estados, das skills e da implantação.

## Limites
Este registro **não autoriza** a IA a inventar preços, prometer gratuidade, confirmar cobertura ou realizar agendamentos sem consulta às fontes e ferramentas oficiais. Não representa implantação do sistema automatizado.

## Complemento informado pela direção — marcas e orçamento (14/11/2026)
- A Winservice atende equipamentos de qualquer marca, observada a necessidade de verificar o tipo de equipamento e a solicitação.
- Para **lava e seca LG** e **lava e seca Samsung**, **não é cobrada a avaliação/orçamento**.
- Para **lava e seca de outras marcas**, a avaliação/orçamento é cobrada, conforme declaração da direção.
- **Valor da cobrança não informado**; não presumir valores ou condições adicionais.
- **Pendente de confirmação:** se a afirmação sobre cobrança para “o restante” também abrange outras categorias de equipamentos, ou apenas lava e seca de outras marcas.
- A regra de cobrança também havia sido descrita como dependente da região; faltam detalhamento de exceções e conciliação dessa variável com as regras acima.

## Esclarecimento da direção — classificação de marcas por equipamento (14/11/2026)
- A política de cobrança de orçamento **não se limita a lava e seca**: aplica-se à análise de qualquer categoria de equipamento atendida.
- Há marcas em que a Winservice é especializada e **não cobra orçamento**, marcas neutras e marcas consideradas mais problemáticas, para as quais pode haver cobrança de orçamento **mais elevada**.
- A classificação precisa ser definida por **combinação de tipo de equipamento e marca**, com eventuais condicionantes de região e solicitação; não presumir que a classificação de uma marca em lava e seca se aplique a todas as categorias.
- Regra específica já informada: para **lava e seca LG e Samsung**, não cobrar orçamento; para outras marcas de lava e seca, há cobrança, sujeita à futura matriz de valores e exceções.
- **Pendências:** relação de categorias de equipamentos; marcas especializadas, neutras e problemáticas em cada categoria; valores e exceções regionais; tratamento comercial de cada classe.
- Até a matriz estar definida, o agente deve consultar uma regra aprovada ou encaminhar para confirmação humana, sem inventar preços ou isenções.

## Decisão da direção — identificação de atendimento existente (14/11/2026)
- Ao receber mensagem no WhatsApp, o sistema procura o contato pelo identificador/número normalizado e consulta os atendimentos existentes, sem assumir que um número corresponda a um único atendimento.
- **Regra aprovada:** a IA deve tentar inferir pelo conteúdo da mensagem se o cliente deseja continuar um atendimento aberto ou iniciar outro, **perguntando apenas quando houver dúvida**.
- Se a intenção corresponder claramente a um atendimento existente, retomar o contexto e o estado desse atendimento; se for um novo equipamento ou uma nova solicitação distinta, criar atendimento separado para o mesmo contato.
- Proposta técnica: persistir clientes/contatos, atendimentos e mensagens em entidades separadas, com identificador único por atendimento; validar a escolha do atendimento e evitar duplicações antes de qualquer transição de estado.
- Não expor dados sensíveis de atendimentos anteriores apenas por correspondência de número; exigir confirmação adicional quando necessário.
- Esta regra está documentada, mas a automação ainda não foi implementada.

## Decisão da direção — retomada após interrupção (14/11/2026)
- Se o cliente interromper a conversa durante a qualificação e voltar posteriormente, a IA deve **retomar do ponto em que parou**, aproveitando as informações já coletadas no atendimento correspondente.
- Não repetir perguntas respondidas, salvo quando houver necessidade de confirmar dados desatualizados, contraditórios ou alterados pelo cliente.
- A retomada deve respeitar a regra de identificar o atendimento correto pelo contexto, perguntando apenas em caso de ambiguidade.
- Proposta técnica não implantada: persistir o estado da qualificação e campos coletados por atendimento; consultar dados atualizados de disponibilidade, condições comerciais e agenda antes de prometer ou confirmar qualquer serviço.
- Pendente definir política de acompanhamento de clientes sem resposta, prazos e encerramento de solicitações abandonadas.

## Decisão da direção — recusa com período de retenção (14/11/2026)
- Quando o cliente recusar expressamente o serviço, registrar o atendimento como **recusado**, preservando o histórico e permitindo retomada caso ele procure novamente.
- **Prazo confirmado pela direção: 30 dias** no estado recusado, contados a partir da recusa.
- A recusa deve **interromper imediatamente os follow-ups comerciais** dessa solicitação; manter registro não autoriza novas mensagens de insistência.
- Se o cliente voltar espontaneamente durante o período, a IA deve identificar o atendimento anterior e retomar o contexto, verificando novamente condições e disponibilidade atualizadas.
- Proposta técnica: distinguir status comercial recusado, prazo de retenção operacional e política de arquivamento. Após **30 dias**, passar automaticamente para **arquivado**, sem apagar o histórico; uma nova manifestação do cliente pode iniciar novo atendimento com referência ao histórico, conforme identificação contextual.
- O motor de follow-up será separado da máquina de estados, com políticas por etapa; intervalos e quantidade de tentativas ainda não definidos.

## Confirmação final do prazo de recusa (14/11/2026)
- A direção confirmou expressamente a proposta de **30 dias como recusado**, seguidos de arquivamento operacional automático com preservação do histórico.
- Nenhum follow-up comercial deve ser enviado após recusa expressa. Retomada durante os 30 dias ocorre somente por iniciativa do cliente.
- Implementação e rotina de arquivamento ainda pendentes.

## Decisão da direção — inatividade sem resposta (14/11/2026)
- Se o cliente interromper a conversa sem recusar o serviço, o atendimento **permanece na etapa principal atual** (por exemplo, qualificação), mas sua **situação de interação** passa a **sem resposta / aguardando cliente**.
- A direção confirmou **15 dias sem resposta** como prazo para arquivamento operacional por inatividade, preservando histórico e informações coletadas para eventual retomada.
- A situação de interação deve ser modelada separadamente da etapa da máquina de estados, evitando perda do progresso da qualificação ou de outra etapa.
- O motor de follow-up poderá agir conforme a etapa, interrompendo tentativas quando houver resposta ou recusa. **Até duas tentativas** foram sugeridas pelo assistente, mas ainda não confirmadas pela direção; intervalos e regras de envio seguem pendentes.
- Proposta técnica ainda não implantada: armazenar etapa principal, situação de interação, instante da última resposta do cliente e prazo de inatividade; ao atingir 15 dias sem resposta, arquivar operacionalmente sem apagar o histórico; em retorno espontâneo, recuperar contexto e revalidar dados dinâmicos.
