# Projeto de Infraestrutura de Dados para Adventure Works

## Descrição do Projeto
A Adventure Works (AW) é uma indústria de bicicletas em franco crescimento, com mais de 500 produtos, 20.000 clientes e 31.000 pedidos.  
Em sua jornada para se tornar uma empresa data-driven, a AW decidiu construir uma infraestrutura moderna de dados para otimizar suas decisões e melhorar o desempenho das operações.   
O projeto visa criar um data warehouse na nuvem que integre dados de várias fontes, com o uso de ferramentas como dbt, Snowflake e Power BI.  
O objetivo principal do projeto é garantir que a diretoria da empresa consiga tomar decisões mais assertivas e estratégicas, com base em dados confiáveis e bem estruturados,
que estarão disponíveis por meio de dashboards interativos.
***
## Objetivos
- Criação de uma infraestrutura de dados robusta e moderna que permita à Adventure Works tomar decisões mais informadas e estratégicas.
- Garantia da qualidade dos dados, com a validação da veracidade das informações, conforme solicitado pelo CEO Carlos Silveira.
- Desenvolvimento de análises de dados para responder às principais perguntas de negócios, como vendas por produto, ticket médio, melhores clientes e cidades, entre outras.
- Entrega de um painel de BI interativo que possibilite a visualização de métricas chave para as áreas comerciais, financeiras e de operação da empresa.
***
## Estrutura e Fases do Projeto
O Modern Data Stack (MDS) se refere a um conjunto de tecnologias e práticas modernas para gerenciar e analisar dados de forma eficiente, escalável e orientada a resultados. 
Ele inclui componentes como data lakes, data warehouses, ferramentas de ETL/ELT, transformação de dados, orquestração de pipelines de dados, plataformas de Business Intelligence (BI), e mais. 
A adoção do MDS traz diversas vantagens, principalmente para empresas que buscam ser mais ágeis, escaláveis e data-driven.

**1. Fontes de Dados**   
A coleta de dados para o projeto de infraestrutura de dados da Adventure Works começou com a identificação das fontes de dados existentes na empresa. 
A AW possui sistemas que geram dados de diferentes áreas do negócio, e esses dados precisam ser extraídos, integrados e transformados para uso no data warehouse. 
As fontes de dados identificadas incluem:  
- ERP - SAP: Sistema que armazena dados operacionais e financeiros, como pedidos, estoque, produtos e vendas.  
- CRM - Salesforce: Sistema que contém dados sobre clientes, interações e comportamento de compra.  
- Web Analytics - Google Analytics: Sistema que fornece dados de comportamento de usuários no site da empresa, como visitas, origens de tráfego e conversões.  
- Site - Wordpress: Sistema que armazena dados relacionados ao conteúdo e interações no site da empresa, como páginas acessadas e tempo gasto.  
Esses sistemas, junto com a base de dados PostgreSQL já existente, contêm informações cruciais para a análise de vendas, clientes, produtos e outros aspectos importantes para o negócio.

**2. Coleta de Dados**  
A coleta de dados envolve a extração das informações de cada um desses sistemas e sua disponibilização em um formato acessível para integração no data warehouse. 
A Adventure Works já utiliza sistemas robustos, mas a integração precisa ser feita de forma eficiente para garantir que os dados estejam acessíveis de maneira unificada
em uma infraestrutura de dados centralizada, com foco na criação de um data warehouse na nuvem. 

**3. Integração de Dados**  
Após a coleta dos dados, o próximo passo foi a integração dessas informações em um único ambiente de dados centralizado. 
A principal ferramenta utilizada para essa integração foi o dbt (data build tool), que facilita a transformação e organização dos dados dentro do data warehouse 
na nuvem (Snowflake). A integração ocorreu por meio dos seguintes passos:

- Transformação e Limpeza de Dados: Utilizando o dbt, os dados brutos extraídos dos sistemas foram transformados, limpos e estruturados em modelos adequados para análise. 
Isso incluiu:  
  -Limpeza de dados: Remoção de valores nulos ou inconsistentes.  
  -Normalização: Padronização de formatos e tipos de dados.  
  -Agrupamento e Cálculos: Criação de agregações, como a soma de vendas por produto, o ticket médio e o total negociado.
- Criação de Tabelas de Fatos e Dimensões: Baseado nas perguntas de negócio e nas necessidades da empresa, foi feita a definição das tabelas de fatos 
(ex: vendas, pedidos) e dimensões (ex: produto, cliente, motivo de venda, tempo, localização). 
Essas tabelas foram projetadas para permitir análises eficientes e rápidas.
- Testes de Qualidade de Dados: Como solicitado pelo CEO da empresa, foram realizados testes de dados para garantir que os dados extraídos e transformados estivessem corretos e consistentes. 
Isso incluiu a validação de valores críticos (como as vendas brutas de 2011) e a realização de testes de primary keys, sources e integridade referencial.
- Integração com Snowflake: Os dados transformados foram integrados ao Snowflake. 
O Snowflake foi escolhido por sua capacidade de escalabilidade, flexibilidade e facilidade de integração com o dbt.

O armazenamento do código foi feito em um repositório GitHub, pois ele proporciona segurança, facilidade de colaboração, controle de versão, automação, acesso remoto, 
backup e visibilidade, tornando-o uma ferramenta essencial para qualquer projeto de desenvolvimento, inclusive para projetos de analytics e data engineering. 

**4. Documentação e Governança de Dados**  
A documentação de todas as tabelas, colunas e modelos foi criada dentro do dbt e disponibilizada para que as equipes de negócios e TI possam facilmente entender a estrutura dos dados e como acessá-los. 
Também foi implementado um processo de governança para garantir que os dados mantivessem sua qualidade e fossem utilizados de forma consistente por todas as partes interessadas.

**5. Preparação para Análises e Visualização**  
Após a integração e validação dos dados, os dados ficaram prontos para análise. 
A próxima fase envolveu a criação de painéis de BI no Power BI para responder às perguntas de negócios da AW.

**6. Criação de Painéis de BI**  
Esta etapa teve como objetivo desenvolver dashboards interativos que forneçam insights acionáveis sobre os dados de vendas.
Criar painéis de BI no Power BI traz uma série de vantagens, incluindo visualizações interativas, acesso a dados em tempo real, tomada de decisão baseada em dados, 
automação de processos, colaboração e segurança de dados. Essas características fazem do Power BI uma ferramenta poderosa para empresas que buscam se tornar mais data-driven
e melhorar sua eficiência na análise e na tomada de decisões.

O Modern Data Stack (MDS) oferece uma abordagem moderna e eficiente para lidar com dados em grande escala. 
Suas vantagens incluem escalabilidade, integração simplificada, agilidade, governança de dados aprimorada, redução de custos, colaboração eficiente 
e a capacidade de incorporar tecnologias emergentes como machine learning e inteligência artificial. Essas vantagens permitem que empresas se tornem mais ágeis,
data-driven, e inovadoras, mantendo uma infraestrutura de dados flexível e preparada para o futuro.

***
## Considerações Finais
- Para garantir o sucesso a longo prazo da implementação da infraestrutura de dados e das ferramentas de BI, é fundamental investir na capacitação contínua das equipes. A formação em ferramentas de análise de dados, como Power BI, e em práticas de Data Analytics, garantirá que todos os colaboradores da Adventure Works possam interpretar os dados de forma eficaz e tomar decisões mais informadas. Isso fortalecerá a cultura de uma empresa data-driven, onde todos os departamentos poderão utilizar as análises para tomar decisões mais precisas e embasadas.

- Ao analisar o histórico de vendas e as campanhas promocionais, a empresa poderá prever de forma mais precisa a demanda por produtos em diferentes períodos. Isso ajudará a otimizar as promoções e reduzir os riscos de comprometimento da lucratividade. A utilização de modelos preditivos permitirá ajustar campanhas de marketing de maneira mais estratégica, com base em dados concretos e previsões, proporcionando uma vantagem competitiva no mercado.

- O uso dos dashboards deve ser contínuo, com uma avaliação regular dos resultados das estratégias de vendas e promoções. É necessário ajustar as táticas com base nos dados gerados, garantindo uma abordagem flexível e adaptável às mudanças do mercado. Acompanhando o desempenho de forma constante, a Adventure Works poderá otimizar seus processos e melhorar suas decisões comerciais de maneira contínua.