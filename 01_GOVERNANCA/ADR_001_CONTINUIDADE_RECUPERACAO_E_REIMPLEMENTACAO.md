# ADR-001 — Continuidade, recuperação de desastre e reimplementação integral

**Status:** PROPOSTA — aprovação expressa pendente
**Tipo:** Decisão de arquitetura e governança corporativa
**Versão:** 0.1
**Data:** 16/11/2026
**Escopo:** Toda a Winservice, seus sistemas, processos críticos, integrações e automações
**Responsável pela aprovação:** Direção
**Referências:** `AGENTES.md`, `00_INSTITUCIONAL/REGRAS_DA_EMPRESA.md`, `01_GOVERNANCA/GUIA_USO_REPOSITORIO.md`

## Contexto
O conhecimento necessário para operar ou reconstruir um sistema não pode depender de conversas, de uma única pessoa, de um servidor, de um fornecedor, nem da memória de uma IA. É necessário conseguir tanto **restaurar** serviços e dados quanto **reimplementar** a solução em infraestrutura inteiramente nova, inclusive quando os backups originais forem inutilizáveis. Os dois objetivos são distintos: reconstrução não garante recuperação de dados históricos sem backups.

## Decisão proposta
1. Cada sistema, integração, automação ou processo digital classificado como crítico terá um **DRP (Disaster Recovery & Reimplementation Plan)** versionado e mantido junto à sua documentação de referência.
2. Cada DRP contemplará dois caminhos separados:
   - **Recuperação:** restauração a partir de backups, snapshots e artefatos preservados, com verificação de integridade.
   - **Reimplementação limpa:** provisionamento do zero em infraestrutura, contas e instalações novas, utilizando documentação, infraestrutura como código, migrations, exports, configurações e testes reproduzíveis.
3. Os DRPs incluirão **instruções operacionais para agentes de IA** (`AGENTES.md` e/ou documento `INSTRUCOES_IA_REIMPLEMENTACAO.md`) com limites de autonomia, ordem de leitura, verificações, critérios de parada, aprovações e protocolo de registro de evidências. A IA não deverá inferir segredos, executar migrações destrutivas ou ativar produção sem autorização.
4. Cada DRP deverá possuir: proprietário e substituto; inventário e dependências; mapa de arquitetura e fluxo de dados; versões e requisitos; inventário de DNS/TLS/infraestrutura; repositórios e commits; migrations e seeds não sensíveis; exportações de workflows; mapeamento de credenciais e processo de rotação; backups e retenção; recuperação e reimplementação passo a passo; testes de aceitação; plano de rollback; monitoramento; riscos; contatos; registro de ensaios e pendências.
5. Segredos e dados pessoais permanecerão em cofres e sistemas autorizados. Documentação e Git não substituem backups externos, exportações completas nem guarda de segredos. Documentar **como obter** credenciais, não seus valores.
6. Definir por sistema criticidade, RPO, RTO, frequência de backup, periodicidade dos ensaios e responsáveis; não inventar valores antes da avaliação de impacto.
7. Exigir **teste real em ambiente isolado** para declarar um DRP validado. Status possíveis: `RASCUNHO`, `DOCUMENTADO_NAO_TESTADO`, `TESTADO_PARCIALMENTE`, `VALIDADO`, `DESATUALIZADO`.
8. Toda mudança material de arquitetura, esquema, integração, infraestrutura ou procedimento operacional deverá atualizar o DRP e os documentos de instrução de IA afetados, com referência a commit, migration, export e evidências.
9. Priorizar recuperação por dependências (infraestrutura → identidade/segredos → bancos → serviços → integrações → validação), mas adaptar ao sistema e não presumir ordem universal.
10. Sistemas SaaS multitenant exigirão isolamento, verificação de permissões e não vazamento de regras de um tenant para outro.

## Alternativas consideradas
- Somente backups: não documenta recriação nem dependências e pode falhar quando a infraestrutura original não existe.
- Somente documentação: não restaura dados e não comprova executabilidade.
- Conversas com IA como fonte: contexto pode ficar indisponível ou desatualizado.
- **Escolha proposta:** documentação versionada + backups independentes + artefatos reproduzíveis + ensaios.

## Consequências
**Benefícios:** menor dependência de pessoas e fornecedores, reconstrução auditável, onboarding de operadores/IA, controle de mudanças.
**Custos e riscos:** esforço contínuo de manutenção, backups externos, testes periódicos, necessidade de gestão de segredos e controle de acesso. Documentos desatualizados geram falsa confiança.

## Implementação após aprovação
1. Publicar modelo corporativo `MODELO_DRP.md` e modelo de instruções para IA.
2. Inventariar sistemas e atribuir responsáveis, criticidade, RPO e RTO.
3. Priorizar Chatwoot, n8n, Supabase e atendimento automatizado; incorporar o runbook existente sem considerá-lo DRP validado.
4. Versionar exports, migrations, infraestrutura como código e referências aos backups seguros.
5. Executar ensaio de restauração e de reimplementação limpa em ambiente isolado, registrando diferenças e lacunas.
6. Adotar revisão do DRP como critério de conclusão de mudanças relevantes.

## Critérios para aprovação e revisão
A Direção deve aprovar explicitamente este ADR antes de ele se tornar norma vigente. A aprovação não autoriza, por si só, alterar produção, restaurar dados reais, contratar serviços ou compartilhar credenciais. Revisar após o primeiro ensaio de desastre e sempre que houver mudança estrutural significativa.

## Registro de decisão
- 16/11/2026: proposta elaborada a pedido da Direção; **aprovação formal pendente**.
