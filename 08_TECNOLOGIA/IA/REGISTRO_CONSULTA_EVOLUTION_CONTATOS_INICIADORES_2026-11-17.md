# Consulta de contatos que iniciaram conversa — Evolution API

**Status:** Em apuração (resultado não confirmado)  
**Data:** 17/11/2026  
**Escopo:** WhatsApp da Winservice, instância Evolution API `51981459630`  
**Natureza:** Registro técnico de acompanhamento; não constitui política nem resultado final.

## Solicitação e regra de contagem

Apurar, desde o início do histórico disponível, quantos **contatos únicos enviaram a primeira mensagem** à Winservice. Excluir grupos e conversas iniciadas pela empresa. Deduplicar identificadores `@lid` e `@s.whatsapp.net` que representem o mesmo contato. Verificar a mensagem cronologicamente mais antiga de cada conversa; o campo `lastMessage` **não prova** quem iniciou.

## Estado verificado

- O n8n da Winservice tem credencial Evolution API associada à instância.
- Foi criado no n8n, no projeto pessoal, o workflow manual **Winservice | Consulta chats iniciados por clientes**, ID `obnI8eXyB8dix7fi`, URL: https://workflows.winservicers.com/workflow/obnI8eXyB8dix7fi.
- Endpoint consultado (somente leitura de dados): `POST https://evo.winservicers.com/chat/findChats/51981459630`.
- Execução manual `9961694`, em 17/11/2026, retornou status **success** e dados de chats.
- **Total de contatos iniciadores: pendente.** A consulta de chats, isoladamente, não identifica o remetente da primeira mensagem.
- Foi criada uma verificação automatizada horária para retomar a apuração e avisar o solicitante quando houver contagem confiável. A criação da automação não comprova a conclusão da apuração.

## Próximas verificações

1. Obter histórico de mensagens por conversa, respeitando paginação e limites da API.
2. Determinar a primeira mensagem registrada e verificar `key.fromMe === false`.
3. Excluir grupos, mensagens técnicas e conversas sem histórico suficiente para classificar.
4. Resolver equivalências de `@lid` e números, contar pessoas únicas e documentar cobertura temporal, lacunas e total confirmado.
5. Atualizar este registro com resultado, metodologia e data da extração. Evitar incluir conteúdo de mensagens, telefones de clientes ou credenciais no GitHub.

## Referências

- Workflow n8n: https://workflows.winservicers.com/workflow/obnI8eXyB8dix7fi
- Instância de atendimento: `51981459630`

## Solicitação adicional — primeiras três mensagens

**Solicitado em 17/11/2026; execução pendente.** Após apurar os contatos únicos que iniciaram conversa, recuperar, para **cada contato elegível**, as **três primeiras mensagens cronológicas da conversa** (independentemente do remetente), incluindo data/hora, direção (cliente ou Winservice) e texto quando disponível. Não confundir com as três últimas mensagens. Quando houver menos de três mensagens, registrar somente as existentes; identificar histórico incompleto ou não recuperável. Deduplicar números e identificadores LID antes de consolidar.

**Armazenamento e privacidade:** Como mensagens de clientes podem conter dados pessoais, não publicar conteúdo integral em documento aberto ou em logs. Antes de persistir transcrições identificáveis no GitHub, confirmar a base legal, a necessidade e as restrições de acesso; preferir relatório privado com identificadores minimizados e conteúdo estritamente necessário. Registrar no repositório a metodologia, os totais e o local seguro do relatório; não inserir segredos ou credenciais.

## Objetivo analítico — mensagens de abertura mais frequentes

**Solicitação da Direção em 17/11/2026; análise ainda não realizada.** Usar a **primeira mensagem enviada pelo cliente** em cada conversa iniciada por cliente para descobrir as formulações de abertura mais recorrentes. As três primeiras mensagens cronológicas por contato servem como contexto para interpretar a intenção, mas **não** devem ser todas somadas como mensagens iniciais.

Entregáveis: total de contatos elegíveis; distribuição de primeiras mensagens por texto normalizado e frequência absoluta/percentual; categorias de intenção (ex.: pedido de orçamento, equipamento/defeito, agendamento, cumprimento genérico), com critérios documentados; exemplos anonimizados; observações sobre mensagens automáticas, mídia sem transcrição e histórico incompleto. Preservar textos originais apenas em armazenamento privado adequado e com acesso restrito, quando necessário. Não publicar números identificáveis nem conversas completas no repositório.
