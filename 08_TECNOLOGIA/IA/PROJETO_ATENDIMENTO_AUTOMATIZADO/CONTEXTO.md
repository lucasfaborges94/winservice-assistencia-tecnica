# Projeto — Atendimento Automatizado Winservice

**Organização aprovada:** 17/11/2026, dentro de `08_TECNOLOGIA/IA/`.
**Situação:** Desenvolvimento em andamento; produção requer auditoria antes de qualquer mudança.

## Objetivo
Atendimento automatizado com IA, Chatwoot, n8n e Supabase, incluindo qualificação e encaminhamento humano.

## Documentos
- [Runbook e histórico de testes](RECUPERACAO_ATENDIMENTO_AUTOMATIZADO.md)
- [Plano de recuperação e pendências](DRP_ATENDIMENTO_AUTOMATIZADO.md)

## Verificação atual em 17/11/2026
Consulta somente leitura ao n8n identificou workflow `xKLAexEfJxATiHDC`, nome **Winservice | Atendimento | Produção**, **ativo**, **72 nós**, atualização registrada em 16/11/2026 às 20:07:32 UTC, com webhook de produção configurado. Diverge da documentação de 16/11/2026 que descreve piloto inativo com 25 nós. Não foi verificado tráfego real, sucesso de atendimentos, nem segurança da ativação. **Não executar alterações em produção antes de auditar a versão atual e conciliar documentação.**

## Próximos passos
Auditar nós, conexões, gatilhos, histórico de execuções e integrações; verificar efeitos sobre clientes; atualizar runbook e DRP com fatos confirmados. Preservar backups e credenciais.
