# MODELO — Instruções para agentes de IA em recuperação e reimplementação

**Status:** MODELO PROPOSTO, não vigente até aprovação da ADR-001
**Aplicação:** Adaptar por sistema, anexar ao DRP e complementar `AGENTES.md` da hierarquia.
**Objetivo:** Permitir que uma IA, sem memória prévia, reconstrua o sistema com segurança, supervisão e evidências.

## Ordem de leitura
1. `/AGENTES.md` e normas institucionais vigentes.
2. ADRs aprovadas e DRP específico do sistema.
3. Arquitetura, dependências, inventário, migrations, exports e instruções locais.
4. Registros de testes, incidentes e mudanças recentes.

## Protocolo de execução
1. Confirmar identidade do sistema, ambiente, objetivo (restaurar ou reimplementar), autorização, acesso e ponto de retorno.
2. Inventariar estado real antes de alterar qualquer recurso. Não presumir versões, IDs, caminhos ou existência de backups.
3. Apresentar plano com etapas, riscos, alterações, impacto, validações e rollback. Distinguir ações somente leitura de mutações.
4. Exigir autorização explícita para operações destrutivas, acesso a dados reais, rotação de credenciais, alteração de DNS, migração e ativação de produção. A existência deste documento não concede autorização.
5. Executar em passos pequenos, com checkpoints verificáveis e logs sem segredos. Interromper ao detectar divergência crítica.
6. Usar credenciais exclusivamente por cofre/canal seguro; nunca expor tokens, senhas, dados pessoais ou dumps sensíveis em respostas, commits e logs.
7. Após cada etapa, testar, registrar evidência, atualizar artefatos e documentar o que permanece pendente.
8. Antes do cutover, comprovar testes de integridade, segurança, isolamento de tenants, rollback e aprovação humana.
9. Se faltar ferramenta, permissão, backup, documentação ou evidência, declarar a limitação; não inventar execução ou resultado.

## Formato obrigatório de registro de cada etapa
- **Etapa / objetivo:**
- **Ambiente / sistema / versão:**
- **Autorização recebida:**
- **Estado antes:**
- **Ação efetivamente executada:**
- **Resultado e evidências:**
- **Estado depois:**
- **Rollback / recuperação:**
- **Pendências e próximo checkpoint:**

## Critérios de parada imediata
Alvo ou tenant ambíguo; risco de perda de dados; backup inválido; segredo exposto; conflito entre documentação e estado real; erro de permissão; teste crítico reprovado; escopo fora da autorização.

## Encerramento
Declarar claramente `VALIDADO`, `TESTADO_PARCIALMENTE` ou `NÃO VALIDADO` com evidências. Nunca equiparar configuração concluída a recuperação testada.
