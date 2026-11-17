# Inventário de integrações externas utilizadas pela Winservice no ChatGPT

**Data da revisão:** 17/11/2026  
**Status:** Registro técnico de integrações disponíveis nesta sessão; não equivale à homologação de todas as conexões  
**Escopo:** Somente serviços externos ligados às atividades da Winservice. Recursos nativos do modelo, automações internas do ChatGPT e ferramentas de criação/gestão de plugins não fazem parte deste inventário.

## Integrações

| Integração | Uso empresarial | Situação verificada nesta sessão |
| --- | --- | --- |
| GitHub | Repositório institucional e documentação versionada da Winservice | Leitura e escrita confirmadas no repositório oficial |
| Supabase — ERP Winservice | Banco de dados e recursos do ERP | Ferramenta disponível; conexão não testada nesta revisão |
| n8n — Winservice | Workflows e automações da empresa | Ferramenta disponível; conexão não testada nesta revisão |
| Hostinger | Domínio, DNS e VPS da empresa | Ferramenta disponível; conexão não testada nesta revisão |
| Canva | Criação e edição de materiais visuais da empresa | Ferramenta disponível; conexão não testada nesta revisão |

**Critério:** esta lista registra integrações empresariais acessíveis ao agente nesta sessão. Não comprova que cada serviço esteja atualmente em uso operacional ou autenticado. Confirmar a situação de cada integração durante a homologação.

## Guias de conexão, configuração e validação

### GitHub
1. No ChatGPT, localizar o plugin GitHub em Configurações > Plugins, quando disponível, e iniciar a conexão.
2. Autorizar acesso ao repositório `lucasfaborges94/winservice-assistencia-tecnica` com o menor escopo de permissões necessário.
3. Confirmar leitura de `AGENTES.md` e `CONTEXTO.md`.
4. Validar escrita apenas em documento autorizado; respeitar o guia de governança documental.
5. Se falhar, revisar autorização da conta e permissões do repositório.

### Supabase — ERP Winservice
1. Identificar o projeto e ambiente correto no Supabase.
2. Conectar o plugin/integrador pelo fluxo seguro disponibilizado, sem expor chaves no chat ou no GitHub.
3. Começar com acesso de leitura; liberar escritas conforme necessidade e autorização.
4. Validar consulta não destrutiva de metadados e confirmar que o projeto é o esperado.
5. Para alterações em schema ou produção, consultar documentação e prever reversão.

### n8n — Winservice
1. Verificar endpoint HTTPS e configuração de acesso MCP ou conector da instância n8n.
2. Conectar no ChatGPT pelo plugin correspondente, usando autenticação segura.
3. Restringir acesso a workflows e ações necessárias.
4. Validar listagem e leitura de um workflow de teste.
5. Antes de ativar ou alterar automações, verificar efeitos sobre mensagens, dados e operações reais.

### Hostinger
1. Localizar o plugin Hostinger no ChatGPT e iniciar a conexão autorizada.
2. Selecionar os recursos empresariais necessários: domínio, DNS e VPS.
3. Validar consulta de leitura ao domínio `winservicers.com` ou ao estado de VPS.
4. Antes de editar DNS ou infraestrutura, registrar a configuração anterior e obter aprovação.

### Canva
1. Localizar Canva em Configurações > Plugins e conectar a conta ou equipe empresarial correta.
2. Revisar os acessos concedidos aos designs.
3. Validar leitura de um design de teste, sem alterar materiais oficiais.
4. Submeter mudanças na identidade visual à aprovação da Direção.

## Checklist de homologação

Para cada integração, registrar: responsável, data, ambiente, autenticação confirmada ou não, escopo de permissão, teste de leitura, teste de escrita (somente quando autorizado), resultado, pendências e modo de revogar acesso. Nunca registrar credenciais.

## Histórico

- 17/11/2026: inventário inicial criado com ferramentas externas e recursos nativos.
- 17/11/2026: adicionados guias de configuração e validação.
- 17/11/2026: por solicitação da Direção, removidos recursos nativos e ferramentas internas; mantidas somente cinco integrações externas relacionadas à Winservice.
