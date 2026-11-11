# Governança Documental da Winservice

<badge>REVISÃO PENDENTE</badge>

> **Status:** Minuta para revisão  
> **Versão:** 0.1  
> **Data de elaboração:** 11/11/2026  
> **Área responsável:** Governança  
> **Abrangência:** Toda a Winservice — Assistência Técnica Especializada  
> **Aprovação:** Pendente  
> **Próxima revisão:** A definir após a primeira rodada de análise

---

## 1. Objetivo

Estabelecer critérios para criar, identificar, organizar, revisar, aprovar, publicar, alterar, armazenar e arquivar documentos da Winservice.

Esta norma busca assegurar que a documentação institucional seja confiável, rastreável, acessível às pessoas autorizadas e coerente entre os diferentes setores da empresa.

## 2. Abrangência

Aplica-se aos documentos mantidos no repositório institucional da Winservice, incluindo, entre outros:

- políticas, diretrizes e normas internas;
- processos, procedimentos e instruções de trabalho;
- manuais, guias e materiais de treinamento;
- formulários, modelos e registros;
- planejamentos, relatórios e indicadores;
- decisões administrativas e registros de reuniões;
- documentos de apoio às atividades comerciais, operacionais, financeiras, jurídicas, de marketing, tecnologia e demais áreas.

Documentos legais, fiscais, contábeis, contratuais ou registros operacionais sujeitos a requisitos próprios também deverão observar suas regras específicas de guarda, acesso, integridade e retenção. Esta norma não substitui tais requisitos.

## 3. Princípios de governança documental

A gestão documental deverá observar os seguintes princípios:

1. **Fonte oficial:** cada documento deverá possuir um local oficial de armazenamento claramente identificável.
2. **Rastreabilidade:** alterações relevantes deverão possuir histórico verificável.
3. **Responsabilidade:** todo documento normativo ou operacional deverá ter uma área responsável por seu conteúdo.
4. **Clareza:** documentos deverão utilizar linguagem objetiva, estrutura consistente e terminologia compreensível.
5. **Controle de acesso:** informações deverão ser disponibilizadas conforme a necessidade de conhecimento e as autorizações aplicáveis.
6. **Integridade:** alterações não deverão eliminar indevidamente informações necessárias à compreensão do histórico.
7. **Atualidade:** documentos deverão ser revisados quando houver mudança relevante e periodicamente, conforme sua criticidade.
8. **Proporcionalidade:** o nível de controle deverá ser compatível com o risco e o impacto do documento.
9. **Não duplicidade:** deverá ser evitada a manutenção de cópias concorrentes como se fossem versões oficiais.
10. **Evolução controlada:** padrões poderão ser aperfeiçoados, preservando-se o histórico das decisões e versões anteriores.

## 4. Estrutura do repositório

O repositório GitHub denominado **Winservice Assistência Técnica** será o ambiente central de documentação institucional.

A estrutura deverá separar os conteúdos por área organizacional. A estrutura inicial de referência é:

```text
/
├── README.md
├── 00_INSTITUCIONAL/
├── 01_GOVERNANCA/
├── 02_COMERCIAL/
├── 03_MARKETING/
├── 04_OPERACIONAL/
├── 05_FINANCEIRO/
├── 06_JURIDICO/
├── 07_RECURSOS_HUMANOS/
├── 08_TECNOLOGIA/
└── 99_ARQUIVO/
```

A estrutura é evolutiva. Novas áreas e subdivisões poderão ser criadas quando houver necessidade organizacional.

### 4.1. Responsabilidade das pastas

- **00_INSTITUCIONAL:** identidade, apresentação, histórico, estrutura e informações gerais da empresa.
- **01_GOVERNANCA:** políticas corporativas, normas, gestão documental, riscos e decisões de governança.
- **02_COMERCIAL:** estratégia comercial, atendimento comercial, propostas, relacionamento e rotinas de vendas.
- **03_MARKETING:** posicionamento, marca, campanhas, canais, fornecedores e acompanhamento de agências.
- **04_OPERACIONAL:** execução dos serviços, atendimento, assistência técnica, processos e procedimentos.
- **05_FINANCEIRO:** controles, planejamento, faturamento, pagamentos, custos e relatórios financeiros.
- **06_JURIDICO:** contratos, documentos legais, obrigações, pareceres e controles jurídicos.
- **07_RECURSOS_HUMANOS:** funções, responsabilidades, integração, capacitação e rotinas de pessoas.
- **08_TECNOLOGIA:** sistemas, arquitetura, integrações, infraestrutura, segurança e documentação técnica.
- **99_ARQUIVO:** documentos obsoletos ou substituídos que precisem ser preservados por razões históricas, administrativas ou legais.

A existência de uma pasta não significa que todos os documentos ali armazenados estejam aprovados ou vigentes.

## 5. Classificação dos documentos

Os documentos deverão ser classificados pelo seu propósito. Uma mesma área poderá conter diferentes tipos documentais.

| Tipo | Finalidade |
|---|---|
| Política | Estabelece princípios e diretrizes obrigatórias |
| Norma | Define requisitos e regras internas |
| Processo | Descreve o fluxo de atividades para alcançar um resultado |
| Procedimento | Orienta a execução padronizada de uma atividade |
| Instrução de trabalho | Detalha uma tarefa específica |
| Manual ou guia | Reúne orientações de consulta e referência |
| Plano | Define objetivos, ações, responsáveis e prazos |
| Registro | Comprova ou documenta um acontecimento ou atividade |
| Relatório | Apresenta informações, análises e resultados |
| Formulário ou modelo | Padroniza a coleta de informações ou a elaboração de documentos |
| Decisão | Registra uma decisão, seu fundamento e seus efeitos |

Quando necessário, a área responsável poderá criar classificações complementares, sem comprometer a compreensão dos tipos acima.

## 6. Identificação e nomenclatura

Os nomes dos arquivos deverão ser claros, objetivos e consistentes.

Padrão recomendado:

```text
TIPO_ASSUNTO_OU_PROCESSO.md
```

Exemplos:

- `POLITICA_ATENDIMENTO_AO_CLIENTE.md`
- `PROC_AGENDAMENTO_DE_SERVICOS.md`
- `IT_INSPECAO_TECNICA.md`
- `PLANO_MARKETING_2027.md`
- `REGISTRO_REUNIAO_AGENCIA_MARKETING.md`

Regras:

- utilizar nomes descritivos;
- preferir letras maiúsculas e números nos nomes de arquivos institucionais;
- evitar acentos, espaços e caracteres especiais nos nomes dos arquivos;
- separar palavras com sublinhado;
- não incluir expressões vagas como “final”, “final2” ou “novo”;
- não inserir a versão no nome do arquivo quando o histórico do Git for suficiente;
- utilizar identificadores sequenciais em séries documentais que exijam controle próprio, como decisões formais.

A nomenclatura poderá ser ajustada para atender a necessidades específicas de cada série documental.

## 7. Identificação obrigatória no conteúdo

Documentos controlados deverão apresentar, preferencialmente no início, os seguintes metadados:

| Campo | Descrição |
|---|---|
| Título | Nome oficial do documento |
| Identificador | Código único, quando aplicável |
| Área responsável | Setor responsável pelo conteúdo |
| Tipo documental | Política, processo, procedimento etc. |
| Versão | Versão do conteúdo |
| Status | Situação atual do documento |
| Data de elaboração | Data de criação da versão |
| Última revisão | Data da última revisão concluída |
| Responsável pela elaboração | Pessoa ou função responsável |
| Aprovador | Pessoa ou função competente para aprovar |
| Próxima revisão | Data prevista, quando aplicável |

Metadados desconhecidos ou ainda não definidos deverão ser indicados como “A definir” ou “Pendente”, sem preenchimento por suposição.

## 8. Status documental

Todo documento controlado deverá possuir um status explícito.

| Status | Significado |
|---|---|
| Em elaboração | Conteúdo ainda em construção |
| Revisão pendente | Minuta aguardando análise e validação |
| Em revisão | Conteúdo em processo de análise |
| Aprovado | Conteúdo formalmente aprovado |
| Vigente | Documento aprovado e atualmente aplicável |
| Suspenso | Aplicação temporariamente interrompida por decisão competente |
| Obsoleto | Documento substituído ou que deixou de ser aplicável |
| Arquivado | Documento preservado sem aplicação operacional corrente |

Um documento não poderá ser considerado aprovado ou vigente apenas por estar publicado no GitHub ou por possuir histórico de commits.

A aprovação deverá ser expressa e registrada. Quando aplicável, a entrada em vigor deverá ser indicada separadamente da data de aprovação.

## 9. Elaboração, revisão e aprovação

### 9.1. Elaboração

A elaboração poderá ser realizada pelo responsável da área, por pessoa designada ou com apoio de terceiros.

O autor deverá:

- identificar a finalidade e o público do documento;
- consultar documentos relacionados;
- indicar premissas, limitações e dependências;
- utilizar os padrões documentais vigentes;
- sinalizar claramente os pontos ainda não validados.

### 9.2. Revisão

A revisão deverá avaliar, conforme a natureza do documento:

- correção e completude das informações;
- coerência com as políticas e decisões da empresa;
- viabilidade de execução;
- responsabilidades e competências;
- riscos e impactos em outras áreas;
- requisitos legais, regulatórios, contratuais ou técnicos aplicáveis;
- clareza e consistência da redação.

Documentos com impacto em mais de uma área deverão ser submetidos à análise das áreas afetadas.

### 9.3. Aprovação

A aprovação caberá à direção ou à pessoa formalmente delegada, observadas as competências internas.

Documentos com impacto jurídico, financeiro, operacional, tecnológico ou sobre dados pessoais deverão receber análise especializada quando a natureza do conteúdo exigir.

A pessoa que elabora poderá também revisar o próprio documento em situações simples, mas documentos de maior risco ou impacto deverão, preferencialmente, contar com revisão independente.

### 9.4. Publicação

Após aprovação, o status deverá ser atualizado e a data de vigência registrada, quando aplicável.

A publicação deverá indicar a versão aprovada e, quando necessário, comunicar os setores afetados.

## 10. Versionamento e histórico de alterações

O GitHub será utilizado para manter o histórico técnico das alterações nos arquivos.

Além do histórico do Git, documentos controlados deverão manter um quadro de revisões quando isso for útil para a compreensão administrativa do documento.

Padrão de versionamento recomendado:

- **0.x:** minuta em elaboração ou revisão, ainda não aprovada;
- **1.0:** primeira versão formalmente aprovada;
- **1.1, 1.2 etc.:** alterações incrementais que não modificam substancialmente as regras ou a finalidade;
- **2.0, 3.0 etc.:** revisões substanciais que alteram estrutura, responsabilidades, regras ou funcionamento.

A classificação de uma alteração como incremental ou substancial deverá ser decidida pela área responsável, considerando o impacto do conteúdo.

### 10.1. Histórico de revisões

| Versão | Data | Descrição | Responsável | Status |
|---|---|---|---|---|
| 0.1 | 11/11/2026 | Emissão inicial para análise | Governança | Revisão pendente |

Não se deverá sobrescrever o histórico de forma que impeça a identificação de alterações relevantes.

## 11. Controle de alterações no GitHub

O repositório deverá utilizar o Git como mecanismo de controle de versão.

Recomendações:

1. Cada alteração deverá possuir uma mensagem de commit objetiva.
2. Alterações relacionadas deverão ser agrupadas de maneira coerente.
3. Alterações em documentos aprovados deverão ser submetidas à revisão conforme sua criticidade.
4. Sempre que o fluxo de trabalho permitir, alterações em documentos normativos vigentes deverão ocorrer por branch e Pull Request, com revisão antes da integração à branch principal.
5. Alterações emergenciais deverão ser justificadas e revisadas posteriormente.
6. Exclusões de documentos controlados deverão ser excepcionais, justificadas e autorizadas.
7. O histórico do Git não substitui registros formais de aprovação.

Exemplos de mensagens:

- `docs(governanca): cria política de gestão documental`
- `docs(marketing): registra reunião com agência`
- `docs(operacional): atualiza procedimento de atendimento`

A adoção de proteção de branch, revisão obrigatória e regras de aprovação deverá ser configurada no GitHub conforme o plano disponível e as necessidades da empresa.

## 12. Responsabilidades

### 12.1. Direção

- aprovar políticas e documentos institucionais de sua competência;
- definir responsáveis por áreas e documentos;
- resolver conflitos de responsabilidade;
- autorizar exceções relevantes;
- assegurar que a governança documental seja aplicada.

### 12.2. Governança

- manter esta norma e seus modelos;
- orientar a padronização documental;
- acompanhar a organização do repositório;
- promover revisões periódicas;
- identificar inconsistências e documentos sem responsável;
- apoiar o controle de decisões e alterações.

### 12.3. Responsável por cada área

- manter atualizada a documentação de seu setor;
- designar autores e revisores;
- validar a exatidão do conteúdo;
- identificar documentos que perderam validade;
- comunicar mudanças que afetem outras áreas.

### 12.4. Autores e revisores

- elaborar e revisar documentos com diligência;
- utilizar fontes confiáveis;
- registrar pendências e incertezas;
- respeitar os níveis de acesso;
- não declarar aprovação sem autorização.

### 12.5. Administradores do repositório

- administrar acessos e permissões;
- preservar a integridade e disponibilidade do repositório;
- manter práticas adequadas de segurança;
- apoiar a recuperação de versões e documentos.

As atribuições individuais e os nomes dos responsáveis serão definidos pela direção.

## 13. Periodicidade e gatilhos de revisão

Como referência inicial:

| Categoria | Periodicidade sugerida |
|---|---|
| Políticas e normas corporativas | Anual |
| Processos e procedimentos operacionais | Anual ou quando houver mudança relevante |
| Documentos jurídicos e regulatórios | Conforme exigência aplicável e orientação especializada |
| Planos estratégicos e de marketing | Conforme ciclo de planejamento |
| Manuais técnicos | Quando houver mudança de sistema, equipamento ou método |
| Registros de eventos e reuniões | Após a ocorrência, sem revisão periódica obrigatória |

Independentemente da periodicidade, uma revisão deverá ser iniciada quando ocorrer:

- alteração de legislação ou requisito aplicável;
- mudança de processo, sistema, estrutura ou responsabilidade;
- identificação de erro ou inconsistência;
- ocorrência relevante, incidente ou risco;
- auditoria ou análise que recomende alteração;
- decisão da direção.

A data prevista de revisão é um controle administrativo e não significa que o documento se torne automaticamente inválido ao chegar essa data.

## 14. Acesso, confidencialidade e proteção de informações

O acesso deverá observar o princípio do menor privilégio: cada pessoa terá acesso apenas às informações necessárias para suas atribuições.

Como classificação inicial, recomenda-se:

| Classificação | Tratamento |
|---|---|
| Pública | Informação autorizada para divulgação externa |
| Interna | Uso institucional, sem divulgação externa não autorizada |
| Confidencial | Acesso restrito a pessoas ou funções autorizadas |
| Restrita | Acesso altamente limitado, conforme autorização específica |

A classificação deverá ser indicada no documento quando houver conteúdo que exija controle especial.

### 14.1. Cuidados especiais

Não deverão ser publicados no repositório, sem avaliação e proteção adequadas:

- senhas, tokens, chaves de API e credenciais;
- dados bancários ou financeiros de acesso restrito;
- documentos pessoais desnecessários;
- dados pessoais de clientes, colaboradores ou terceiros sem justificativa e autorização adequadas;
- informações protegidas por sigilo profissional, contratual ou legal;
- segredos comerciais cuja exposição não seja necessária.

O repositório privado não elimina os riscos de exposição. Acesso, compartilhamento, cópias locais e histórico de versões também deverão ser considerados.

Dados pessoais deverão ser tratados conforme a legislação aplicável, especialmente a LGPD, com finalidade definida, necessidade, segurança e controle de acesso.

## 15. Registros, documentos obsoletos e arquivamento

Documentos substituídos deverão ser identificados como obsoletos ou arquivados, conforme sua finalidade.

Sempre que possível:

- preservar o documento histórico;
- indicar qual documento o substituiu;
- registrar a data de encerramento de sua vigência;
- impedir que versões antigas sejam confundidas com documentos atuais;
- respeitar prazos legais, contratuais e administrativos de retenção.

A pasta `99_ARQUIVO` será utilizada para documentos que precisem de preservação fora das áreas ativas.

O arquivamento no GitHub não deverá ser considerado, isoladamente, um plano de backup ou de preservação de longo prazo.

## 16. Modelos documentais

A Governança poderá manter modelos padronizados para:

- políticas e normas;
- processos e procedimentos;
- instruções de trabalho;
- atas e registros de reunião;
- planos de ação;
- relatórios;
- decisões institucionais;
- controle de revisão.

O uso de modelos será obrigatório quando definido para determinada categoria documental.

## 17. Exceções

Exceções a esta norma deverão:

1. possuir justificativa;
2. indicar o documento ou requisito afetado;
3. identificar o responsável pela solicitação;
4. avaliar os riscos envolvidos;
5. ser aprovadas pela autoridade competente;
6. possuir prazo ou condição para reavaliação, quando aplicável.

Nenhuma exceção poderá afastar obrigação legal ou requisito contratual aplicável.

## 18. Não conformidades documentais

São exemplos de não conformidade:

- documento normativo sem responsável;
- documento vigente sem aprovação identificável;
- versões concorrentes sem indicação de qual é oficial;
- conteúdo desatualizado com risco de execução incorreta;
- exposição indevida de informação confidencial;
- ausência de histórico ou justificativa para alteração relevante.

As não conformidades deverão ser comunicadas ao responsável pela área e tratadas conforme sua gravidade e impacto.

## 19. Disposições finais

Esta norma estabelece a proposta inicial de governança documental da Winservice.

Enquanto estiver com status **Revisão pendente**, deverá ser utilizada como referência de trabalho para discussão e organização, e não como política corporativa definitivamente aprovada.

Após a revisão, deverão ser definidos:

- autoridade responsável pela aprovação;
- responsáveis formais por cada área;
- classificação definitiva de acesso;
- periodicidades de revisão;
- fluxo de aprovação e publicação;
- configuração de permissões e proteção de branches no GitHub;
- requisitos específicos de retenção e backup.

A versão aprovada deverá substituir esta minuta como referência normativa.

---

## 20. Controle de aprovação

| Etapa | Responsável | Data | Resultado |
|---|---|---|---|
| Elaboração da minuta | Governança | 11/11/2026 | Concluída |
| Revisão crítica | A definir | Pendente | Não iniciada |
| Validação pelas áreas impactadas | A definir | Pendente | Não iniciada |
| Aprovação da direção | A definir | Pendente | Não iniciada |
| Publicação como norma vigente | A definir | Pendente | Não iniciada |

**Status atual: REVISÃO PENDENTE — NÃO APROVADO.**
