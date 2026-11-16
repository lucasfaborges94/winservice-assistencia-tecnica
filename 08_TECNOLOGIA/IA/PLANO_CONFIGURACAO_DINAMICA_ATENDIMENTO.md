# Plano técnico — configuração dinâmica e isolamento do atendimento automatizado

**Status:** IMPLEMENTAÇÃO PARCIAL CONTROLADA — configuração inicial aplicada no n8n
**Data:** 16/11/2026
**Sistema:** n8n workflow `xKLAexEfJxATiHDC` (inativo; 25 nós)
**Vínculo:** [DRP](DRP_ATENDIMENTO_AUTOMATIZADO.md), [ADR-001](../../01_GOVERNANCA/ADR_001_CONTINUIDADE_RECUPERACAO_E_REIMPLEMENTACAO.md)

## Constatação somente leitura
- Os nós `Ler conversa autorizada no Chatwoot`, `Validar whitelist e montar histórico`, `Consultar mensagem processada`, `Persistir estado e deduplicar`, `Consultar estado real do encaminhamento`, `Prévia elegibilidade de transferência`, `Preparar transferência em simulação` e outros usam identificadores e valores de homologação fixos.
- O fluxo de homologação é manual e inativo; a ramificação de atribuição automática está desconectada e os dois nós de escrita correspondentes estão desabilitados.
- Existe um nó antigo `Transferir somente conversa 1149` com método HTTP POST, mas sem conexão a partir de gatilho ativo. **Não o conectar sem aprovação específica.**
- A autorização da aprovação humana no nó `Exigir autorização explícita para aprovar` está codificada como `false`.
- Os valores específicos de homologação devem ser mantidos em configuração protegida, não convertidos diretamente em permissões gerais.

## Contrato de configuração proposto (não é schema implementado)
```json
{
  "environment": "homologacao",
  "tenant_key": "winservice-homologacao",
  "chatwoot": {
    "base_url": "https://chat.winservicers.com",
    "account_id": 1,
    "inbox_id": 17,
    "team_id": 1
  },
  "execution": {
    "mode": "PREVIEW_ONLY",
    "outbound_enabled": false,
    "assignment_enabled": false,
    "manual_approval_required": true
  },
  "allowed_conversations": [
    {"conversation_id": 1149, "contact_id": 1089},
    {"conversation_id": 1152, "contact_id": 1089}
  ]
}
```
**Atenção:** exemplo de estrutura, não configuração aplicada. Não incluir telefone ou segredo em arquivo versionado. Validar telefone autorizado via cofre/configuração segura e constraints existentes. A allowlist não concede permissão de executar transferências.

## Ordem de implementação proposta
1. Preservar export versionado do workflow atual; revisar e remover dados pessoais e credenciais em claro.
2. Introduzir nó inicial `Carregar configuração de homologação`, com fonte única e validação estrita de ambiente, tenant, conta, inbox, conversa, contato e equipe.
3. Em homologação, parametrizar apenas **conversa 1152** na primeira iteração; manter a allowlist e constraints atuais. Não habilitar outras conversas.
4. Substituir valores fixos nas leituras e SQL por parâmetros de execução **validados**, com queries parametrizadas; nunca concatenar valores de entrada diretamente em SQL.
5. Garantir que cada escrita tenha condição de tenant, conversa, contato e estado autorizado; falha de configuração deve interromper a execução.
6. Separar políticas por tenant: regras da Winservice em configuração própria; lógica comum do SaaS independente.
7. Adicionar testes de regressão para autorização, duplicação, mensagens de atendente, payload inválido, corrida, reconciliação e falha parcial.
8. Somente depois, avaliar webhooks de entrada, filas, idempotência transacional e eventual ativação com aprovação específica.

## Critérios de aceitação antes de ampliar o piloto
- Sem envio de WhatsApp nem atribuição Chatwoot não autorizada.
- Identificadores não derivados de texto de cliente nem de saída da IA.
- Tenant e allowlist verificados antes de cada acesso e gravação.
- Não há caminho conectado do gatilho até nó HTTP POST de atribuição.
- Credenciais não são expostas em logs ou GitHub.
- Importação e rollback do workflow comprovados por ensaio.
- DRP atualizado e evidências de testes registradas.

## Pendências identificadas
- Export JSON completo e revisado.
- SQL integral de migrations e políticas RLS.
- Configuração dinâmica ainda não implementada.
- Revisão do nó antigo de transferência 1149 antes de qualquer mudança de conectividade.

## Implementação incremental — 16/11/2026
- **Aplicado no n8n:** criado o nó `Carregar configuração restrita de homologação` antes da leitura de mensagens. Ele fornece `tenantKey`, `accountId`, `inboxId`, `teamId`, `conversationId`, `contactId`, `mode`, `outboundEnabled` e `assignmentEnabled`, com validação fail-closed para os valores já autorizados.
- **Aplicado no n8n:** URL de leitura Chatwoot passou a consumir `accountId` e `conversationId` da configuração validada.
- **Verificação posterior:** workflow **inativo**, 26 nós, gatilho manual ligado ao nó de configuração, nós de transferência real desabilitados e sem conexão de entrada. Não houve execução de teste nem envio externo nesta etapa.
- **Ainda não implementado:** parametrização de SQL e demais nós; persistência externa da configuração; IDs de novas instalações; export JSON completo; testes de execução e reimplementação. Portanto o plano permanece **PARCIALMENTE IMPLANTADO**.
- **Avisos do n8n:** dois nós desconectados preexistentes e recomendação de agrupar nós no canvas; não indicam ativação.
