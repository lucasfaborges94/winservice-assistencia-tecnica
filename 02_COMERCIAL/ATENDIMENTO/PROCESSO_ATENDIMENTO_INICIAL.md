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
