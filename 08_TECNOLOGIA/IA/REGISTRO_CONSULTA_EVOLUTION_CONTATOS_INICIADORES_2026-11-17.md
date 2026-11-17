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
