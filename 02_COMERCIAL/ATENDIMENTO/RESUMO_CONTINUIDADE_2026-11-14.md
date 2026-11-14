# Resumo de continuidade — atendimento automatizado Winservice
**Data:** 14/11/2026
**Status:** Documento de passagem de contexto; decisões de negócio registradas, arquitetura proposta não implantada.
**Fonte oficial:** repositório lucasfaborges94/winservice-assistencia-tecnica, branch main. Não confundir com o projeto separado winservice-leads-roi.

## Objetivo e escopo
Automatizar atendimento de WhatsApp, inicialmente qualificação de leads, apresentação das condições de avaliação/orçamento e agendamento. Evoluir progressivamente para o ciclo completo de atendimento. A IA conversa; o sistema valida regras, disponibilidade e transições de estado. Stack em discussão: n8n + Supabase + IA, um agente inicial com skills separadas de qualificação, condições comerciais e agendamento. Tudo isso ainda é proposta de implementação.

## Decisões confirmadas
1. **Qualificação:** coletar tipo de equipamento, marca, defeito/solicitação e bairro/região; endereço completo pode ficar para agendamento. Consultar se o serviço é atendido antes de prometer visita.
2. **Condições comerciais:** cobrança/isenção varia por tipo de equipamento, marca e região; marcas especializadas, neutras e problemáticas classificadas por categoria. Lava e seca LG e Samsung têm avaliação/orçamento gratuito; outras marcas de lava e seca têm cobrança, sem valor definido. Não inventar valores.
3. **Catálogo dinâmico:** categorias não ficam fixas em prompt/skill. Lava e seca é atendida; purificadores de água estão em ativação com parceiro técnico, sujeito a confirmação da capacidade real. É possível desativar sem excluir histórico.
4. **Disponibilidade de categoria:** ativo, temporariamente indisponível (com previsão de retorno), reativação pendente e inativo. Ao atingir a previsão, o sistema solicita confirmação automaticamente e marca reativação pendente; **só pessoa autorizada reativa manualmente**. Enquanto pendente, a IA não promete agenda. Se necessário, nova previsão é cadastrada.
5. **Notificações:** solicitações de confirmação chegam em **área de notificações interna por usuário** no sistema integrado à IA; responsável toma decisão humana, com registro de autoria/data. Canal externo não é requisito.
6. **Identificação de cliente e atendimento:** WhatsApp é chave inicial de contato, não ID único de atendimento. Consultar atendimentos associados; a IA infere pela mensagem se continua um caso ou cria outro; **pergunta só se houver ambiguidade**. Um cliente pode ter vários casos. Não revelar dados sensíveis sem verificação apropriada.
7. **Retomada:** cliente que volta dias depois retoma a etapa anterior com dados já coletados, evitando repetição; revalidar regras, disponibilidade e agenda mutáveis.
8. **Follow-up:** função/motor separado da máquina de estados, mas integrado, com abordagem por etapa. Interromper tentativas quando houver resposta ou recusa; respeitar regras de mensagens do WhatsApp. Prazos e número de tentativas ainda não aprovados (duas tentativas foram sugestão, não decisão).
9. **Recusa explícita:** manter como recusado por **30 dias**, sem follow-up comercial; retorno espontâneo nesse período pode retomar; após 30 dias, arquivar automaticamente preservando histórico.
10. **Sem resposta, sem recusa:** manter etapa principal inalterada e situação de conversa como aguardando cliente/sem resposta. Após **15 dias sem resposta**, arquivar preservando histórico; eventual retorno recupera contexto.
11. **Situações iniciais da conversa:** ativa, aguardando cliente, aguardando equipe, encerrada. São distintas da etapa principal e podem ser ampliadas. 'Aguardando equipe' cobre necessidade de ação/validação humana. Estado comercial e motivo do encerramento devem continuar distinguíveis.

## Distinções de modelagem
- **Etapa do atendimento:** qualificação, condições comerciais, aceite, agendamento etc. — detalhamento de transições ainda não finalizado.
- **Situação da conversa:** ativa, aguardando cliente, aguardando equipe, encerrada.
- **Resultado/estado comercial:** recusado, arquivado, em andamento etc. Não confundir com situação de conversa.
- **Status do catálogo de equipamentos:** ativo, temporariamente indisponível, reativação pendente, inativo — independente do atendimento individual.
- **Follow-up:** motor com regras por etapa; não muda estado principal arbitrariamente.

## Ponto exato para retomar
O usuário precisou sair e pediu para salvar tudo no GitHub, com intenção de continuar depois. **Próximo tema combinado:** amarrar situações da conversa às etapas do atendimento, começando por **qualificação**: quando começa, quando termina, critérios objetivos de avanço para apresentação de condições comerciais, pendências e exceções. Fazer uma pergunta por vez e não tentar exaurir todos os cenários agora.

## Pendências e limites
- Definir lista completa de categorias, regiões, matriz de preços/isenções e responsáveis.
- Confirmar operação de purificadores e agenda do parceiro.
- Desenhar transições detalhadas, regras de escalonamento humano, confirmação de agendamento e política de follow-up.
- Definir interfaces, permissões, banco, notificações e workflows concretos.
- Nenhuma implementação em produção foi realizada neste trabalho. Decisões documentadas não significam automações ativas.

## Documentos relacionados
- 02_COMERCIAL/ATENDIMENTO/PROCESSO_ATENDIMENTO_INICIAL.md
- 02_COMERCIAL/ATENDIMENTO/CADASTRO_EQUIPAMENTOS_ATENDIDOS.md

## Atualização de continuidade — 14/11/2026, 13h40 (Brasília)

### Decisões adicionais confirmadas
- Qualificação inicia na primeira mensagem de um novo atendimento, com situação **ativa**. Coleta os quatro dados mínimos já definidos (equipamento, marca, defeito e bairro/região), aproveitando o que o cliente já informou e perguntando apenas o que faltar, uma informação por vez.
- Com os dados completos, executar validação das regras dinâmicas de atendimento (equipamento, marca, região e disponibilidade). Se qualificado, avançar para apresentação das condições comerciais no fluxo futuro; se não qualificado, encerrar com motivo.
- **Toda finalização exige motivo obrigatório**, sem criar uma situação diferente para cada causa. Situações de conversa: ativa, aguardando cliente, aguardando equipe e encerrada. Exemplos de motivos: serviço não atendido, fora da região, recusa e inatividade. Manter o motivo separado da situação.
- **15 dias sem resposta**: encerramento/arquivamento automático por inatividade, com motivo e histórico preservado. Implementação técnica no motor de follow-up fica para depois. Conciliar com a regra anterior de recusa explícita e janela de 30 dias; não disparar follow-up após recusa.
- Estratégia de implantação **por módulos completos**. Módulo 1: qualificação automatizada no WhatsApp, validação, persistência, histórico e transferência com resumo para atendimento humano. Atendimento comercial automatizado e agendamento serão módulos posteriores.
- Skill sozinha não basta: serão necessárias tools de consulta e gravação para a operação futura, regras/catálogos dinâmicos, integração n8n, persistência Supabase e uma interface mínima no ERP para fila, histórico, assumir atendimento e notificações.
- Sistema de atendimento deve ser **módulo do ERP Winservice**, com motor de IA desacoplado da interface. ERP já utiliza Supabase; não presumir estrutura de tabelas sem inspecioná-las.

### n8n e Supabase — progresso e bloqueio
- Foi relatada criação no n8n da pasta **Winservice ERP → IA - Qualificacao Winservice** e de dois workflows de inspeção, mantidos fora de produção:
  - PostgreSQL / metadados: https://workflows.winservicers.com/workflow/hZ0i9lkihTICImRe
  - Teste API Supabase: https://workflows.winservicers.com/workflow/NNPdIR50zj2pn7Je
- Teste PostgreSQL retornou **Host not found**. Teste via credencial n8n **Supabase Sistema Winservice** também falhou ao estabelecer conexão. Não houve consulta bem-sucedida ao esquema do ERP; nenhuma alteração de dados foi relatada.
- **Autorização expressa:** criar e organizar workflows novos no n8n, porém realizar **somente consultas de leitura** no Supabase durante a inspeção. Não criar, atualizar nem excluir registros ou estrutura do banco. Não ativar workflows novos em produção antes da validação.
- **Próxima ação do usuário:** no computador, abrir n8n > Credentials > **Supabase Sistema Winservice** e verificar URL do projeto e chave correspondente, testar conexão. Não enviar segredos no chat. Priorizar esta credencial API; a credencial PostgreSQL pode ficar para depois.
- **Próxima ação do assistente após confirmação do ajuste:** retestar exclusivamente leitura via n8n, identificar tabelas/relacionamentos reaproveitáveis, documentar achados, desenhar tools e implementar o módulo de qualificação progressivamente. Registrar no GitHub decisões, ações, resultados de testes e pendências, distinguindo projeto planejado de operação comprovada.

**Estado atual:** pausa solicitada pelo usuário para corrigir credencial. Nenhuma conexão Supabase confirmada como funcional; nenhuma skill de qualificação colocada em produção.
