# MODELO — Plano de recuperação e reimplementação (DRP)

**Status:** MODELO CORPORATIVO VIGENTE — conforme ADR-001 aprovada em 16/11/2026
**Sistema:** [nome] | **Proprietário:** [função] | **Substituto:** [função]
**Versão:** [versão] | **Última verificação:** [data] | **Status do DRP:** DOCUMENTADO_NAO_TESTADO
**Criticidade:** [avaliar] | **RPO:** [definir] | **RTO:** [definir]

## 1. Objetivo e escopo
Descrever o que o DRP recupera, o que recria e o que fica fora do escopo. Distinguir recuperação de dados históricos de reimplementação funcional.

## 2. Arquitetura e inventário
Serviços, versões, dependências, domínios, DNS, TLS, redes, volumes, regiões, fornecedores, repositórios e commits de referência. Incluir diagrama e mapa de fluxos.

## 3. Artefatos necessários
| Artefato | Local seguro | Versão/data | Como validar |
|---|---|---|---|
| Export do aplicativo/workflow | [referência] | [versão] | [checksum/teste] |
| Migrations/DDL | [referência] | [versão] | [teste] |
| Infraestrutura como código | [referência] | [versão] | [teste] |
| Backup de dados | [cofre/armazenamento] | [data] | [restauração] |
| Credenciais | [cofre, sem segredo no Git] | [responsável] | [teste de acesso] |

## 4. Pré-requisitos e segurança
Permissões, janela de mudança, aprovação, ambiente isolado, tratamento de dados pessoais e bloqueios para produção.

## 5. Caminho A — restauração de desastre
1. Identificar incidente, preservar evidências e interromper escritas quando necessário.
2. Verificar integridade e data dos backups; calcular perda potencial de dados.
3. Provisionar infraestrutura e restaurar segredos por canal seguro.
4. Restaurar dados, serviços e integrações na ordem de dependência.
5. Validar isolamento, integridade, consistência, funcionalidade e observabilidade.
6. Solicitar aprovação antes de redirecionar tráfego ou reativar produção.
7. Registrar RPO/RTO observados, incidentes e evidências.

## 6. Caminho B — reimplementação limpa
1. Provisionar contas/infraestrutura novas e registrar novas versões e IDs.
2. Instalar serviços e aplicar infraestrutura como código.
3. Criar banco vazio; aplicar migrations e dados iniciais não sensíveis.
4. Importar workflows/configurações; remapear IDs, credenciais e endpoints.
5. Executar testes sintéticos e de segurança; não presumir disponibilidade de histórico.
6. Validar integrações em sandbox e pedir aprovação para cutover.
7. Registrar divergências, lacunas e atualizações documentais.

## 7. Testes obrigatórios
Smoke tests, isolamento multitenant, permissões, deduplicação, falhas de API, recuperação após falha parcial, consistência de dados, logs, alertas, rollback, backup/restore.

## 8. Rollback e contingência
Condições de abortar, passos para retorno seguro, responsável e comunicação.

## 9. Registro de ensaios e mudanças
| Data | Ambiente | Versão/commit | Tipo de teste | Resultado | Evidência | Pendências |
|---|---|---|---|---|---|---|

## 10. Pendências
Não declarar VALIDADO sem ensaio real documentado. Referenciar `INSTRUCOES_IA_REIMPLEMENTACAO.md`.
