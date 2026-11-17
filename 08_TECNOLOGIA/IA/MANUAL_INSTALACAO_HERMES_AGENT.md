# Manual de instalação — Hermes Agent (secretário executivo digital)

**Status:** Guia operacional proposto, não executado  
**Versão:** 1.0 — 17/11/2026  
**Escopo:** VPS exclusiva da Winservice; primeiro agente experimental  
**Responsável pela implantação:** a definir

## 1. Objetivo e limites
Implantar **um** Hermes Agent como secretário executivo digital da Winservice, inicialmente para conversar e consultar documentação autorizada. O modelo de linguagem será acessado pela API da OpenAI; **não** haverá LLM local. A implantação não concede automaticamente acesso ao ERP, CRM, n8n, Supabase, telefonia, Gmail ou WhatsApp. A instalação ainda **não foi realizada**.

## 2. Arquitetura pretendida
- VPS Hostinger KVM 2 **planejada**: 2 vCPU e 4 GB RAM, confirmar especificações no momento da contratação; Ubuntu Server 24.04 LTS, se disponível.
- Hermes Agent instalado na VPS, com execução inicialmente manual e posteriormente serviço persistente, se homologado.
- API da OpenAI para inferência, com cobrança separada do ChatGPT.
- Repositório `lucasfaborges94/winservice-assistencia-tecnica` como fonte de conhecimento, inicialmente **somente leitura**.
- Identidade futura de serviço no ERP com RBAC, credenciais individuais e auditoria; não faz parte do teste inicial.

## 3. Pré-requisitos
1. Contratar e provisionar a VPS isolada, registrar IP e acesso administrativo em cofre seguro, **não neste repositório**.
2. Criar usuário administrativo com sudo e autenticação SSH por chave. Testar o acesso antes de desabilitar métodos antigos.
3. Ter conta na OpenAI Platform, faturamento e limites de gastos configurados; gerar chave específica para o agente.
4. Validar a documentação oficial atual antes de executar comandos: https://hermes-agent.nousresearch.com/docs/getting-started/quickstart

## 4. Preparação do Ubuntu
Conectar por SSH substituindo o usuário e o endereço:
```bash
ssh usuario@IP_DA_VPS
```
Atualizar:
```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y curl git ca-certificates ufw
```
Antes de ativar o firewall, verificar a porta SSH efetivamente utilizada e permitir essa porta. Para SSH padrão:
```bash
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status verbose
```
Manter sessão SSH atual aberta e confirmar uma segunda conexão antes de encerrar a primeira. Configurar atualizações de segurança, backup/snapshot externo e acesso restrito.

## 5. Instalar o Hermes
Verificar o endereço e conteúdo do instalador no site oficial. Baixar e **revisar** antes de executar:
```bash
curl -fsSL https://hermes-agent.nousresearch.com/install.sh -o install-hermes.sh
less install-hermes.sh
bash install-hermes.sh
```
Abrir um novo terminal (ou recarregar o shell configurado pelo instalador). Conferir:
```bash
hermes --help
```
Se o comando não existir, consultar a saída do instalador e os caminhos indicados; não modificar permissões indiscriminadamente nem executar scripts alternativos não verificados.

## 6. Configurar a API OpenAI
Criar a chave em https://platform.openai.com/api-keys e armazená-la somente no mecanismo seguro de configuração da VPS/Hermes, nunca em commits, prints, comandos compartilhados ou logs. Executar:
```bash
hermes setup
```
No assistente, selecionar a configuração completa, o provedor **OpenAI API (direct)** se disponível e um modelo suportado; seguir as opções reais exibidas pela versão instalada. A variável de ambiente normalmente utilizada é `OPENAI_API_KEY`. Nunca publicar seu valor.

## 7. Primeiro teste
```bash
hermes chat
```
Pedir: “Apresente-se como secretário executivo digital em ambiente de teste e liste as ferramentas disponíveis. Não execute ações externas.” Verificar resposta, erros, consumo de API, latência e RAM. Encerrar e reabrir para testar persistência de configurações. Não pressupor memória duradoura sem teste específico.

## 8. Execução contínua (somente após homologação)
Consultar a documentação da versão instalada e avaliar:
```bash
hermes gateway setup
```
Configurar gateway/canais apenas quando necessários. Validar como o processo é iniciado automaticamente, reiniciado em falhas e monitorado; **não** expor painel ou porta de controle publicamente sem autenticação e proteção. Um gateway ativo não implica autonomia proativa sem tarefas e agendamentos configurados.

## 9. GitHub — leitura antes de escrita
Criar credencial dedicada, de escopo mínimo e preferencialmente somente leitura, restrita ao repositório necessário. Não reutilizar token pessoal amplo. Testar a consulta a `AGENTES.md`, `00_INSTITUCIONAL/REGRAS_DA_EMPRESA.md` e `01_GOVERNANCA/GUIA_USO_REPOSITORIO.md`. O `CONTEXTO.md` é dinâmico; consultar conforme necessidade. Nenhuma escrita automática será autorizada nesta fase.

## 10. Segurança e governança
- Credenciais separadas por agente e integração; permissões mínimas, rotação e revogação.
- Não disponibilizar segredos ou dados pessoais no GitHub.
- Registrar ações e custos, com retenção limitada e proteção de logs.
- Exigir aprovação humana para alterações em produção, gastos, envios externos e decisões sensíveis.
- Backups externos e ensaio de restauração antes de dependência operacional.
- Uma VPS por agente ajuda no isolamento, mas não substitui separação de credenciais e RBAC.

## 11. Critérios de aceite
- [ ] VPS provisionada e SSH seguro validado
- [ ] Firewall e atualizações conferidos
- [ ] `hermes --help` funciona
- [ ] OpenAI configurada e cobrança controlada
- [ ] `hermes chat` responde
- [ ] Configuração persiste após reinício
- [ ] GitHub consultado com permissão de leitura
- [ ] Logs e consumo de recursos revisados
- [ ] Backup/restauração planejados e testados antes do uso crítico

## 12. Próximas etapas (não incluídas na implantação inicial)
Definir função de secretário executivo, regras de autonomia, tarefas proativas e integrações com n8n, Supabase, ERP/CRM, e-mail e telefonia. Para sistemas internos, usar identidade própria no RBAC e trilha de auditoria; não compartilhar senha de administrador.

## Referências
- Hermes Quickstart: https://hermes-agent.nousresearch.com/docs/getting-started/quickstart
- OpenAI API Keys: https://platform.openai.com/api-keys
- Governança Winservice: `/AGENTES.md`, `/00_INSTITUCIONAL/REGRAS_DA_EMPRESA.md`, `/01_GOVERNANCA/GUIA_USO_REPOSITORIO.md`

**Nota:** Comandos e opções precisam ser confirmados contra a versão oficial vigente na data da execução. Este manual documenta o procedimento, não certifica uma instalação concluída.
