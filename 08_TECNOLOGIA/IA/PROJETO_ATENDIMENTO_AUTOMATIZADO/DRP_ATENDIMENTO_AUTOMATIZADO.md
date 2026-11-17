# DRP — Atendimento automatizado Winservice (Chatwoot + n8n + Supabase)

**Status do DRP:** DOCUMENTADO_NAO_TESTADO
**Versão:** 0.1 | **Data:** 16/11/2026
**Base normativa:** [ADR-001](../../../01_GOVERNANCA/ADR_001_CONTINUIDADE_RECUPERACAO_E_REIMPLEMENTACAO.md) — aprovada e vigente
**Proprietário operacional / substituto:** A designar pela Direção
**Criticidade / RPO / RTO:** Pendentes de análise de impacto
**Ambiente inventariado:** Homologação isolada; **não autoriza ativação de produção**
**Referências:** [Runbook histórico](RECUPERACAO_ATENDIMENTO_AUTOMATIZADO.md), [modelo corporativo](../../../01_GOVERNANCA/MODELO_DRP.md), [instruções para IA](../../../01_GOVERNANCA/INSTRUCOES_IA_REIMPLEMENTACAO.md)

## 1. Objetivos e fronteiras
- **Caminho A — restauração:** recuperar dados e serviços usando backups íntegros e configurações preservadas.
- **Caminho B — reimplementação limpa:** reconstruir em infraestrutura inteiramente nova com instalação, migrations, importação de fluxos e testes sintéticos. Não pressupor recuperação do histórico sem backups.
- Manter isolamento entre tenant da Winservice e futuros clientes do SaaS. Regras comerciais específicas da Winservice não são padrão global.
- Nenhum passo deste DRP é autorização para executar mutações ou ativar serviços em produção.

## 2. Inventário confirmado via conectores
| Componente | Estado confirmado | Referência |
|---|---|---|
| n8n | Workflow manual, inativo, 25 nós | `xKLAexEfJxATiHDC` em `https://workflows.winservicers.com` |
| Chatwoot | Conta 1; equipe Agendamento ID 1; conversas de homologação 1149/1152 | `https://chat.winservicers.com` |
| Supabase | Schema isolado `atendimento_piloto`, quatro tabelas com RLS habilitado | Conector Supabase ERP Winservice |
| IA | Nó agente e nó de modelo OpenAI presentes no fluxo | Configuração do n8n, sem exportar segredo |
| Workflow de transferência | Nós de escrita Chatwoot e auditoria Supabase **desabilitados**, transferência real desconectada | Inspeção de 16/11/2026 |

**Importante:** RLS habilitado não comprova políticas suficientes nem isolamento multitenant. É obrigatório auditar políticas, grants e privilégios em restauração.

### Tabelas do schema piloto
1. `atendimento_piloto.qualificacoes`: estado da qualificação, tenant, conversa, contato, campos extraídos e último ID de mensagem.
2. `atendimento_piloto.mensagens_processadas`: registro para deduplicação de mensagens externas.
3. `atendimento_piloto.encaminhamentos_humanos`: fila e estado da atribuição, equipe, aprovação e timestamps.
4. `atendimento_piloto.auditoria_encaminhamentos`: trilha de eventos e detalhes JSON.

### Migrations relacionadas identificadas no histórico Supabase
| Versão | Nome |
|---|---|
| 20261115232547 | criar_estado_isolado_atendimento_piloto |
| 20261115233431 | autorizar_conversa_1149_piloto_isolado |
| 20261115234046 | fila_revisao_humana_piloto_1149 |
| 20261115234957 | auditoria_aprovacao_humana_piloto |
| 20261115235426 | destino_equipe_agendamento_homologacao |
| 20261115235435 | funcao_aprovacao_auditada_agendamento |
| 20261116003710 | permitir_segunda_conversa_homologacao_1152 |

**Lacuna crítica:** foi confirmado o **catálogo de nomes e versões**, não o SQL integral de cada migration. O catálogo, sozinho, não permite reconstruir o banco. Capturar e versionar SQL, funções, triggers, índices, constraints, grants e políticas RLS antes de qualquer ensaio.

## 3. Dependências e artefatos obrigatórios
- n8n: export JSON **completo**, versionado, sem credenciais em claro; inventário de tipos/versões de nós, variáveis, credenciais por referência, timezone, modo de execução e políticas de erro.
- Chatwoot: versão, implantação, bancos, armazenamento de anexos, configurações de canal WhatsApp, inbox, contas, equipe, usuários e chaves mantidas em cofre; export/backup verificado.
- Supabase/PostgreSQL: SQL completo e ordenado das migrations; roles, grants, RLS, funções, extensões e seeds não sensíveis; backups consistentes.
- Infraestrutura: provedor/VPS, DNS, TLS, Docker/EasyPanel, volumes, redes, variáveis e versões; registrar **valores não secretos** e local seguro dos segredos.
- IA: modelo, versão, prompts, limites, parâmetros, tratamento de dados e regras de negócio em repositório versionado.
- Backups externos: localização segura, retenção, criptografia, responsáveis, checksum e restauração verificada.
- Não gravar tokens, senhas, dados pessoais ou mensagens de clientes no GitHub.

## 4. Caminho A — restaurar com backups
1. Identificar incidente, escopo e aprovações; preservar evidências e impedir escrita conflitante.
2. Escolher ponto de restauração conforme RPO; verificar checksum e integridade de backup de banco, anexos e configurações.
3. Provisionar infraestrutura de destino isolada; registrar versões e DNS temporário.
4. Restaurar banco Supabase e Chatwoot com roles, políticas, funções, anexos e vínculos de dados.
5. Restaurar n8n e suas configurações necessárias; importar workflow em estado **inativo**.
6. Recuperar credenciais por cofre autorizado e remapear IDs, URLs e referências sem exposição de segredos.
7. Testar leitura, integridade referencial, permissões, deduplicação, consistência de auditoria e ausência de mensagens externas.
8. Só efetuar cutover, troca de DNS e ativação com aprovação específica; documentar RPO/RTO observados.

## 5. Caminho B — reimplementar em ambiente novo
1. Confirmar objetivo: **instalação limpa**, sem histórico salvo, salvo restauração posterior autorizada.
2. Provisionar infraestrutura nova e registrar versões exatas de PostgreSQL/Supabase, n8n e Chatwoot.
3. Configurar rede, domínio temporário, HTTPS, armazenamento persistente, logs e backup antes de conectar canais reais.
4. Instalar Chatwoot e criar conta, inbox, equipe e usuários de teste; **não copiar IDs antigos como se fossem universais**.
5. Criar projeto/banco isolado e aplicar migrations SQL versionadas na ordem correta; verificar funções, constraints, RLS, grants e índices.
6. Importar export JSON do n8n; reconfigurar credenciais por referência e mapear IDs de conta, inbox, equipe e tenant no novo ambiente.
7. Substituir IDs de homologação fixos por configuração e validação explícita; preservar allowlist restritiva.
8. Validar modelo e prompts de IA com dados sintéticos e sem envio externo.
9. Testar estados `QUALIFICACAO`, `AGUARDANDO_EQUIPE`, `PENDENTE_REVISAO`, `ATRIBUIDO`; testar idempotência, falhas HTTP/SQL e recuperação parcial.
10. Registrar evidências e divergências; ativação real só após autorização separada.

## 6. Critérios mínimos de aceitação
- Todos os serviços e configurações críticos inventariados e reproduzidos.
- Schema, funções, grants e RLS verificados; tenant A não acessa B.
- Workflow importado inativo e compatível com as versões instaladas.
- Reprocessamento de mensagem não cria segunda qualificação, encaminhamento nem atribuição.
- Falha após atribuição Chatwoot e antes da auditoria SQL recuperável por reconciliação segura.
- Sem envio automático de WhatsApp durante testes.
- Logs, métricas e alertas funcionais; rollback testado.
- Aprovação humana antes de usar contato ou dados reais.
- Evidências do ensaio arquivadas com data, versão, resultado e responsáveis.

## 7. Procedimento específico para IA
Ler primeiro `AGENTES.md` da raiz, ADR-001, `INSTRUCOES_IA_REIMPLEMENTACAO.md`, este DRP e o runbook histórico. Inventariar o estado real. **Parar** se backup estiver ausente/inválido, se alvo for ambíguo, se houver risco de perda de dados ou se a ação exigir autorização ainda não concedida. Não supor que acesso ao MCP dá autorização para mudar produção. Executar etapas pequenas, registrar antes/depois, evidências, rollback e pendências. Nunca declarar `VALIDADO` sem ensaio.

## 8. Plano de lacunas e próxima atualização
- [ ] Obter export JSON completo do n8n e versioná-lo após revisão de segredos e dados pessoais.
- [ ] Obter SQL integral das migrations e dump estrutural, incluindo grants, RLS, funções e constraints.
- [ ] Inventariar instalação real (versões, VPS, DNS, volumes, Docker/EasyPanel, certificados e backups) sem alterar infraestrutura.
- [ ] Definir proprietário, substituto, criticidade, RPO, RTO e calendário de ensaios.
- [ ] Implementar IDs dinâmicos, allowlist e idempotência com isolamento por tenant.
- [ ] Ensaiar restauração e reimplementação em ambiente isolado; documentar evidências.
- [ ] Revisar DRP a cada mudança relevante.

## 9. Registro de verificação
- **16/11/2026 — Inventário somente leitura:** n8n 25 nós, workflow inativo; Supabase 4 tabelas com RLS habilitado; 7 migrations identificadas pelo catálogo. **Não foi executada restauração, reimplementação ou alteração de produção.**
- **Estado:** DOCUMENTADO_NAO_TESTADO.
