# Runbook — Atendimento automatizado Winservice (piloto e recuperação de desastre)

**Status:** Documento técnico operacional em evolução; NÃO é autorização para produção.
**Versão:** 0.1 — 16/11/2026
**Escopo:** Reconstrução e validação do piloto Chatwoot → n8n → Supabase → Chatwoot.
**Fonte:** Estado verificado via conectores em 16/11/2026. IDs e URLs são referências de homologação, não configurações universais.

## 1. Limites e decisões de segurança
- Produto futuro: SaaS independente, multiempresa; Winservice é o primeiro tenant. Não herdar regras comerciais da Winservice em outros tenants.
- Tenant piloto: `winservice-homologacao`. Contato autorizado: Chatwoot ID 1089, WhatsApp final **1798**, inbox 17. Conversas históricas de teste: 1149 e 1152.
- O workflow está **inativo**, disparo manual. Envio automático ao WhatsApp não implementado/habilitado. Atribuição real e gravação automática foram re-desativadas e desconectadas após teste controlado.
- Nunca habilitar uma automação geral, alterar equipes de outros contatos, apagar dados ou recriar credenciais sem autorização e validação.
- Não copiar chaves de API, tokens, senhas, números completos ou dados de clientes para este repositório.

## 2. Inventário verificado
- n8n self-hosted: `https://workflows.winservicers.com`.
- Workflow piloto: ID `xKLAexEfJxATiHDC`, nome `Winservice | Atendimento piloto V2 | Homologação segura`, URL `https://workflows.winservicers.com/workflow/xKLAexEfJxATiHDC`.
- Chatwoot: `https://chat.winservicers.com`, conta 1, equipe `agendamento` ID 1; atribuição por `POST /api/v1/accounts/1/conversations/{conversation_id}/assignments`, corpo `{"team_id":1}`.
- Supabase/PostgreSQL: schema `atendimento_piloto`, tabelas `qualificacoes`, `mensagens_processadas`, `encaminhamentos_humanos`, `auditoria_encaminhamentos`. Credenciais configuradas no n8n por nome, sem exportar segredos.
- Pipeline atual: gatilho manual → consulta de mensagens → whitelist de contato/inbox/conversa → deduplicação → extração de equipamento, marca, defeito e bairro → prévia SEM envio → persistência → elegibilidade → simulação; há etapa separada de conciliação de auditoria.
- Nós de atribuição HTTP e auditoria PostgreSQL permanecem desativados e sem ligação à simulação. Existe ramificação antiga para conversa 1149 desconectada; não reutilizar sem revisão.
- Restrição SQL de homologação aceita somente conversas 1149 e 1152, contato 1089, equipe 1. Isto é **controle de teste**, não modelo de autorização multi-tenant.

## 3. Evidências de homologação
1. Conversa 1149: qualificação e transferência controlada à equipe 1; registro histórico preservado.
2. Conversa 1152: mensagem inicial `Oi` → `QUALIFICACAO` (execução 9948294).
3. Conversa 1152: mensagem de defeito de purificador → quatro campos extraídos, status `AGUARDANDO_EQUIPE`, fila ID 3 `PENDENTE_REVISAO`; elegibilidade aprovada.
4. Execução 9948359: Chatwoot confirmou equipe 1, Supabase gravou `ATRIBUIDO_EQUIPE` para fila ID 3.
5. Execução 9948379: conciliação `CONSISTENTE`, 1 evento de atribuição. A transferência e a auditoria foram novamente desativadas.
6. Testes anteriores de confirmação: resposta inválida bloqueada (9948226), resposta positiva simulada aceita (9948239).

## 4. Pré-requisitos para reconstrução
1. Provisionar n8n, Chatwoot, PostgreSQL/Supabase e serviço de modelo de IA. Documentar versões, regiões, DNS, TLS, política de backups, volumes, filas e permissões **antes** de reconstruir. Esses detalhes ainda não foram levantados; não presumir configurações.
2. Restaurar bancos a partir de backups verificados. Caso seja ambiente vazio, obter migrations versionadas do schema `atendimento_piloto`, RLS, índices, constraints, funções e permissões. **Ainda falta consolidar export completo das migrations e testes de restauração.**
3. Restaurar Chatwoot (contas, inbox, equipes, usuários, canais) de backup próprio; os IDs podem mudar entre instalações.
4. Importar o workflow de um **export JSON versionado** do n8n; ainda falta capturar e versionar esse export. Não reconstruir manualmente só a partir deste texto.
5. Recriar credenciais secretas no cofre/gerenciador do ambiente, conectando as credenciais n8n por referência. Nunca inserir segredos no Git.
6. Mapear os IDs reais do ambiente restaurado e configurar allowlist e tenant explicitamente. Não copiar 1149/1152 como IDs de produção.
7. Manter workflow inativo e todas as escritas externas bloqueadas até testes de restauração.

## 5. Procedimento de validação pós-restauração
1. Verificar conectividade TLS, DNS, health checks e credenciais mínimas de leitura.
2. Confirmar estrutura do schema, RLS e isolamento por tenant; validar que tenant A não lê/escreve dados de B.
3. Consultar Chatwoot apenas por GET e validar identidade do contato, inbox e equipe.
4. Executar uma qualificação sintética com quatro campos ausentes: nenhum encaminhamento nem envio externo.
5. Executar qualificação sintética completa: exatamente uma mensagem processada e um encaminhamento pendente.
6. Reprocessar a mesma mensagem: nenhum novo registro nem segunda atribuição.
7. Testar erro HTTP, timeout, retorno inesperado, falha SQL e recuperação após HTTP bem-sucedido/SQL malsucedido. O processo de reconciliação deve impedir transferência duplicada.
8. Confirmar auditoria consistente e ausência de envio de mensagens não autorizado.
9. Só então aprovar uma conversa de teste para escrita real controlada. Registrar execução, aprovação e resultado.
10. Produção/multiempresa exige aprovação própria e novos testes de segurança.

## 6. Pendências prioritárias (NÃO implementadas)
- Export JSON completo do workflow e controle de versão com procedimento de importação.
- Export/migrations reproduzíveis do schema, grants, RLS e funções; teste de restore em banco isolado.
- Substituição segura de IDs fixos por contexto validado (tenant, inbox, contato e conversa), com allowlist em banco e validação antes de cada escrita.
- Webhook de novas mensagens com autenticação/assinatura, anti-replay, idempotência e rate limiting.
- Tratamento de erro de duas fases Chatwoot/Supabase e reconciliação sem duplicidade.
- Rotina de backup e restauração testada de n8n, Chatwoot, Supabase, segredos e configurações de infraestrutura; definir RPO/RTO.
- Definir observabilidade, alertas, rotação de segredos, política de retenção e responsáveis.
- Remover ou arquivar ramificações antigas de homologação somente após migração segura.
- Separar regras da Winservice de regras genéricas do SaaS.

## 7. Regra de atualização deste runbook
A cada mudança: registrar data, motivação, ambiente, componentes/IDs alterados, versões ou commits, migrações aplicadas, testes e execuções, resultado, rollback e pendências. Atualizar `CONTEXTO.md` local e avaliar contextos ancestrais. Nunca marcar um passo como testado sem evidência. Git não substitui backup nem cópia externa dos artefatos.
