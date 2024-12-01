## Projeto Fortificar
O Projeto Fortificar é uma ação desenvolvida pela empresa Fortes com o objetivo de auxiliar projetos sociais que estejam alinhados aos Objetivos de Desenvolvimento Sustentável (ODS) da alçada da empresa. A solução busca oferecer suporte para gestão, acompanhamento e transparência na execução de iniciativas sociais, promovendo impacto positivo nas comunidades atendidas.  

A solução do grupo envolve interações dos seguintes tipos: Editais abrem oportunidades para inscrição de projetos sociais, com prazos e descrições detalhadas. Os projetos submetidos possuem identificadores únicos, nomes, responsáveis técnicos e coordenadores, além de serem vinculados a editais específicos. Usuários, que podem ser organizações ou indivíduos, interagem com o sistema e são categorizados como donatários ou funcionários da Fortes. As inscrições conectam usuários a projetos, enquanto propostas detalham os pedidos de recursos com valores associados. Relatórios registram o progresso dos projetos, incluindo datas, imagens e textos descritivos, promovendo transparência e eficiência na execução das iniciativas.


## Estrutura do Sistema
O sistema foi modelado utilizando uma estrutura relacional, composta pelas seguintes entidades principais:

# 1. Editais
Os editais representam os documentos de abertura de oportunidades para inscrição de projetos sociais.
Campos principais:
- edital_cod: Identificador único do edital.
- edital_prazoInicio e edital_prazoFim: Período de vigência do edital.
- edital_descricao: Descrição detalhada do edital.

# 2. Projetos
Os projetos são as iniciativas submetidas aos editais para avaliação e acompanhamento.
Campos principais:
- proj_cod: Identificador único do projeto.
- proj_nome: Nome do projeto.
- proj_respTec e proj_respCool: Identificação dos responsáveis técnico e coordenador.
- cod_edital: Relacionamento com o edital ao qual o projeto está vinculado.

# 3. Usuários
Os usuários representam as pessoas ou organizações que interagem com o sistema.
Campos principais:
- user_cod: Identificador único do usuário.
- user_cnpj: CNPJ (em caso de organizações).
- user_nome: Nome do usuário.
- user_categoria: Categoria do usuário (ex.: donatário ou funcionário).
- user_email e user_tel: Contato.

# 4. Inscrições
As inscrições vinculam os usuários aos projetos nos quais estão envolvidos.
Campos principais:
- cod_usuario: Referência ao usuário inscrito.
- cod_projeto: Referência ao projeto relacionado.

# 5. Propostas e Pedidos
As propostas representam os pedidos de recursos ou apoio feitos por projetos sociais.
Campos principais:
- prope_cod: Identificador único da proposta.
- prope_valor: Valor solicitado.
- user_cod: Relacionamento com o usuário responsável pela proposta.
- proj_cod: Relacionamento com o projeto correspondente.

# 6. Relatórios
Os relatórios permitem registrar o progresso dos projetos ao longo do tempo, promovendo transparência e prestação de contas.
Campos principais:
- relat_cod: Identificador único do relatório.
- relat_data: Data de registro.
- relat_img: Imagens associadas ao relatório.
- relat_text: Texto detalhado do relatório.
- user_cod: Usuário que submeteu o relatório.
- proj_cod: Projeto ao qual o relatório se refere.
