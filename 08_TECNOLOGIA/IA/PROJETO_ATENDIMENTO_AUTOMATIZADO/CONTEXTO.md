# Projeto — Atendimento Automatizado Winservice

**Organização aprovada:** 17/11/2026, dentro de `08_TECNOLOGIA/IA/`.
**Situação:** Desenvolvimento em andamento; produção requer auditoria antes de qualquer mudança.

## Objetivo
Atendimento automatizado com IA, Chatwoot, n8n e Supabase, incluindo qualificação e encaminhamento humano.

## Documentos
- [Auditoria contínua de conversas reais e melhoria de atendimento](AUDITORIA_CONTINUA_ATENDIMENTOS_REAIS.md)
- [Runbook e histórico de testes](RECUPERACAO_ATENDIMENTO_AUTOMATIZADO.md)
- [Plano de recuperação e pendências](DRP_ATENDIMENTO_AUTOMATIZADO.md)

## Verificação atual em 17/11/2026
Consulta somente leitura ao n8n identificou workflow `xKLAexEfJxATiHDC`, nome **Winservice | Atendimento | Produção**, **ativo**, **72 nós**, atualização registrada em 16/11/2026 às 20:07:32 UTC, com webhook de produção configurado. Diverge da documentação de 16/11/2026 que descreve piloto inativo com 25 nós. Não foi verificado tráfego real, sucesso de atendimentos, nem segurança da ativação. **Não executar alterações em produção antes de auditar a versão atual e conciliar documentação.**

## Próximos passos
Auditar nós, conexões, gatilhos, histórico de execuções e integrações; verificar efeitos sobre clientes; atualizar runbook e DRP com fatos confirmados. Preservar backups e credenciais.

## Auditoria contínua iniciada em 17/11/2026
A direção definiu amostra de 11 conversas reais do Chatwoot, com distinção entre Iza (IA) e Felipe (humano), avaliação de qualidade, conversão e sugestões de scripts. O registro de auditoria contém evidências confirmadas da conversa 1179 e pendências de leitura integral; nenhuma alteração em produção foi autorizada.
