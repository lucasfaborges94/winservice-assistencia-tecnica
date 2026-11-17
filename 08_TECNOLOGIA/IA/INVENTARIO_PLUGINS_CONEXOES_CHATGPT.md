# Inventário de plugins, ferramentas e conexões disponíveis ao agente ChatGPT

**Data da verificação:** 17/11/2026  
**Status:** Inventário observacional da sessão; não é confirmação de autenticação de cada serviço  
**Escopo:** Ferramentas anunciadas ao agente nesta conversa, não inventário completo da conta ou de serviços instalados na infraestrutura.

## Integrações externas anunciadas

| Integração / plugin | Finalidade | Estado verificável |
| --- | --- | --- |
| GitHub | Consultar e versionar arquivos, commits e repositórios | **Conexão funcional confirmada** pela leitura de arquivos oficiais nesta sessão |
| Supabase — ERP Winservice | Consultar e administrar dados e recursos do ERP | Ferramentas disponíveis; autenticação e operações não testadas nesta auditoria |
| n8n — Winservice | Consultar e administrar workflows e automações | Ferramentas disponíveis; autenticação e operações não testadas nesta auditoria |
| Hostinger | Consultar e administrar domínios, DNS e VPS | Ferramentas disponíveis; autenticação e operações não testadas nesta auditoria |
| Canva | Criar e editar designs | Ferramentas disponíveis; autenticação não testada nesta auditoria |
| Automations | Criar e gerenciar lembretes e tarefas agendadas | Ferramentas disponíveis; execução não testada nesta auditoria |
| Plugin Creator | Criar e manter plugins personalizados | Ferramentas disponíveis; execução não testada nesta auditoria |
| Plugin Management | Pesquisar plugins e gerenciar permissões/instalações | Ferramentas disponíveis; execução não testada nesta auditoria |

## Capacidades nativas e auxiliares acessíveis nesta sessão

- **Web:** busca pública, pesquisa de negócios e produtos, disponibilidade de restaurantes, imagens e widgets.
- **Python e ambiente de arquivos:** cálculos, análise e criação de artefatos.
- **Geração/edição de imagens:** ferramenta de geração visual.
- **Files:** busca e leitura de arquivos de conversa, projeto e biblioteca.
- **Skills:** consulta a instruções de habilidades instaladas.
- **User Settings:** consulta e alteração de configurações de aparência/personalidade permitidas.
- **Memory/contexto pessoal:** consulta de contexto pessoal e registro de preferências, sujeito a permissões.
- **Voice:** apresentação de respostas em conversas por voz.

## Limitações e segurança

1. A presença de uma ferramenta no catálogo **não comprova** que o plugin esteja instalado globalmente, que a conexão esteja autenticada ou que todas as ações sejam permitidas.
2. A lista reflete **somente o que foi exposto ao agente nesta sessão**. Plugins adicionais podem existir na conta sem estarem disponíveis nesta conversa.
3. Não registrar tokens, chaves de API, senhas, URLs privadas com credenciais nem dados de clientes.
4. Para auditoria operacional, testar cada conexão separadamente, com ações de leitura de baixo risco, e registrar data, resultado e permissões efetivas.
5. Revalidar este inventário após mudanças de conta, projeto, plugins ou permissões.


## Guias de habilitação, instalação e validação

> **Importante:** os procedimentos abaixo são roteiros de referência, não registros de instalações executadas. Os nomes de menus podem mudar. Para plugins do ChatGPT, conferir em **Configurações > Plugins** ou no diretório de plugins disponível na conta. Nunca copiar credenciais para o GitHub. A disponibilidade varia conforme plano, workspace e permissões.

### 1. GitHub
1. Abrir ChatGPT > Configurações > Plugins e localizar GitHub; selecionar a opção de conectar/instalar, quando oferecida.
2. Autorizar a conta GitHub e apenas os repositórios necessários, incluindo `lucasfaborges94/winservice-assistencia-tecnica`.
3. Conferir permissões de leitura e, se a manutenção documental exigir, escrita; usar o menor escopo viável.
4. Validar lendo `AGENTES.md` e `CONTEXTO.md`; testar escrita apenas com alteração documental autorizada.
5. Em falha, conferir autorização OAuth, acesso ao repositório e permissões da organização.

### 2. Supabase — ERP Winservice
1. Identificar o projeto Supabase correto, seu ambiente (produção/desenvolvimento) e a integração disponível no catálogo de plugins.
2. Conectar via fluxo oficial da integração. Caso uma integração personalizada exija endpoint e segredo, configurá-los **somente** no gerenciador seguro da conexão.
3. Conceder inicialmente acesso de leitura; avaliar separadamente privilégios para alterações de dados e schema.
4. Validar com consulta não destrutiva ao projeto e metadados; conferir o ambiente antes de qualquer escrita.
5. Não usar chave `service_role` em documentos, prompts, commits ou ferramentas expostas a clientes.

### 3. n8n — Winservice
1. Confirmar URL HTTPS acessível da instância n8n e disponibilidade do servidor MCP ou conector configurado.
2. No ChatGPT, localizar o plugin n8n e iniciar a conexão com o endpoint e autenticação previstos na implantação.
3. Configurar segredo apenas no fluxo seguro de conexão; restringir ações e workflows expostos.
4. Validar listagem de workflows e leitura de um workflow de teste.
5. Para criar, ativar ou alterar workflows, verificar previamente efeitos em produção, credenciais e risco de disparos.

### 4. Hostinger
1. Localizar o plugin Hostinger em Configurações > Plugins, se disponível.
2. Conectar a conta pelo fluxo de autorização oferecido; habilitar somente os recursos necessários (domínio, DNS, VPS).
3. Validar consultando, sem alterar, o domínio `winservicers.com` ou o status de VPS autorizado.
4. Antes de mudanças em DNS, registrar valores atuais e plano de reversão; exigir aprovação para alterações operacionais.

### 5. Canva
1. Localizar Canva no catálogo de plugins e selecionar Conectar.
2. Autorizar a conta ou equipe correta e revisar o acesso a designs.
3. Validar listando ou abrindo um design de teste sem modificar os materiais oficiais.
4. Para publicar ou substituir identidade visual, obter aprovação da Direção.

### 6. Automations (recurso do ChatGPT)
1. Verificar se tarefas agendadas/automations estão disponíveis na conta.
2. Solicitar uma tarefa simples, como um lembrete de teste com horário explícito.
3. Conferir criação e permissões de notificações; cancelar o teste se não for necessário.
4. Para tarefas recorrentes com dados empresariais, definir escopo, frequência, responsável e política de confidencialidade.
**Observação:** pode ser um recurso integrado, não um plugin que se instala manualmente.

### 7. Plugin Creator
1. Verificar acesso ao criador de plugins no workspace.
2. Definir finalidade, ferramentas necessárias, autenticação e permissões mínimas.
3. Criar um plugin privado de teste pelo fluxo de criação disponível.
4. Validar leituras em ambiente seguro antes de habilitar escritas ou publicar.
**Observação:** a disponibilidade e o fluxo dependem da conta/workspace.

### 8. Plugin Management
1. Abrir Configurações > Plugins para visualizar plugins disponíveis e conectados.
2. Usar o diretório para pesquisar um provedor e instalar/conectar quando necessário.
3. Revisar permissões por plugin; preferir confirmação para operações sensíveis.
4. Validar o estado exibido e uma ação de leitura de baixo risco.
**Observação:** gerenciamento de plugins pode ser capacidade integrada, sem instalação separada.

### 9. Web (pesquisa pública)
1. Verificar se a pesquisa na web está disponível na conversa.
2. Solicitar busca pública por um assunto não confidencial.
3. Validar fontes e datas. Não há conexão com contas externas obrigatória para busca pública.
**Tipo:** recurso nativo, sem instalação de plugin exigida.

### 10. Python e ambiente de arquivos
1. Usar um modo/conversa com análise de dados e execução de código habilitados.
2. Anexar um arquivo de teste não confidencial ou solicitar cálculo simples.
3. Confirmar processamento e, se necessário, exportação do resultado.
4. Não presumir acesso ao disco da VPS ou ao computador local.
**Tipo:** ambiente de execução disponibilizado pela plataforma, não instalação na infraestrutura Winservice.

### 11. Geração e edição de imagens
1. Confirmar acesso à criação de imagens no ChatGPT.
2. Solicitar uma imagem de teste; para edição, fornecer uma imagem autorizada.
3. Validar a saída e revisar direitos de uso e adequação à marca antes da publicação.
**Tipo:** capacidade nativa, sem instalação local.

### 12. Files (arquivos de conversa/projeto/biblioteca)
1. Adicionar um arquivo de teste à conversa ou às fontes do projeto, conforme a interface.
2. Solicitar busca ou leitura de trecho específico.
3. Verificar que o documento correto foi localizado; distinguir fontes estáticas de arquivos atualizados no GitHub.
**Tipo:** capacidade integrada; acesso depende do contexto e permissões.

### 13. Skills
1. Consultar as habilidades disponíveis no ambiente ou no catálogo pertinente.
2. Ler as instruções da habilidade desejada e verificar pré-requisitos.
3. Habilitar/instalar somente se o ambiente oferecer esse fluxo; testar em tarefa não crítica.
4. Não confundir uma Skill com um plugin autenticado nem presumir que a Skill concede acesso a sistemas externos.

### 14. User Settings
1. Abrir Configurações do ChatGPT.
2. Localizar preferências de aparência, cor ou estilo/personalidade disponíveis.
3. Ajustar e confirmar visualmente a mudança, se desejada.
**Tipo:** configuração integrada; não é plugin externo.

### 15. Memory / contexto pessoal
1. Abrir Configurações > Personalização.
2. Revisar a opção de memória e o resumo de memória disponíveis na conta.
3. Habilitar ou desabilitar conforme a política de privacidade; testar com informação não sensível.
4. Não usar memória pessoal como fonte oficial de políticas da Winservice: manter decisões e documentos no GitHub.
**Tipo:** recurso integrado, condicionado à configuração da conta.

### 16. Voice (voz)
1. Abrir o ChatGPT em cliente compatível e iniciar uma conversa por voz.
2. Conceder acesso ao microfone quando solicitado.
3. Validar entrada e saída de áudio; conferir opções de voz nas configurações.
4. Evitar ditar segredos e dados pessoais desnecessários.
**Tipo:** recurso integrado, não instalação de plugin.

## Checklist de homologação de cada integração

Para cada item, registrar: data; responsável; ambiente; disponibilidade na conta; conexão autenticada (sim/não/não testada); escopo de permissão; teste de leitura; teste de escrita **somente se autorizado**; resultado; pendências; procedimento de revogação. Não registrar tokens, senhas nem identificadores secretos.

## Histórico

- 17/11/2026: adicionados guias de habilitação/instalação e validação para cada uma das 16 categorias listadas; procedimentos não executados.\n- 17/11/2026: inventário inicial solicitado pela Direção e baseado no catálogo de ferramentas efetivamente exposto nesta sessão.
