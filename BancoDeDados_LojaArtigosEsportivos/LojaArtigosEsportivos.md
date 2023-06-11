# Loja de Artigos Esportivos

Projeto Final Análise de Sistemas I e Banco de Dados I

ANA ELISA GHANEM ZANON // JULIANA HACHMANN

# 1. Introdução
O aplicativo tem como proposta a criação de um sistema de uma loja de artigos esportivos que possibilite que funcionários da empresa utilizem para cadastrar e buscar informações para a empresa. Durante a entrevista foi apontado pelo cliente que necessitaria de um aplicativo para celular (Android) e desktop para acesso às informações e que fosse um aplicativo prático de uso. Seguindo o princípio de desenvolvimento mobile first, foram criadas as telas do sistema para uso em celulares, que servirão de base para a implementação do sistema em resoluções maiores posteriormente. Observou-se durante a análise de requisitos que seria necessário as funcionalidades de cadastro, busca, exclusão e alteração de informações sobre: produtos, categorias de produto, clientes, funcionários, categoria de funcionário, cupons de desconto, comissão de funcionários e vendas. Para este sistema foi criado um banco de dados utilizando o Sistema Gerenciador de Banco de Dados (SGBD) MySQL, para que as informações sejam gravadas e acessadas pelo cliente.

# 2. Descrição do Sistema

O sistema será utilizado especialmente pelos funcionários dos Caixas nas lojas físicas da empresa e pelos gerentes responsáveis pelo cadastro de produtos e funcionários. Assim, o sistema foi desenhado para comportar dois tipos de usuários com permissões de acesso diferentes. O usuário com permissão de acesso restrita pode cadastrar e buscar produtos e suas categorias, clientes e vendas. Já o usuário “Gerente”, possui acesso completo às funcionalidades adicionais de cadastro de novos funcionários, visualização de relatórios e alterações nas configurações do sistema.
Por meio do sistema, no seu estado atual, é possível aos usuários:
● Cadastrar as vendas, calculando o valor total a partir dos dados dos produtos e também calculando descontos a partir de cupons. Além disto, este cadastro gera automaticamente o registro das vendas feitas por cada funcionário e por cada cliente;
● Criar e enviar cupons de desconto automaticamente, a partir de critérios estipulados pelo gerente, que configura regras de valor e frequência de compras para que o cliente receba os cupons. Estes cupons podem ser enviados previamente aos clientes ou gerados no momento de cadastro da venda;
● Gerar relatórios de venda por período;
● Cadastrar novos produtos e novas categorias de produtos, com informações
detalhadas sobre eles;
● Controlar automaticamente o estoque, que é atualizado de acordo com os registros de venda de produtos;
● Cadastrar novos clientes e atualizar cadastros já existentes no banco de dados;
● Cadastrar novos funcionários e novas categorias de funcionários, atualizar suas informações e permissões de acesso (por meio das categorias), bem como ter um controle dos funcionários que estão ativos ou em férias e de seus salários atuais. Além destas funcionalidades, o sistema e o banco de dados poderão ser interligados a outros que não estão no escopo deste projeto. Como exemplo, citamos o sistema de RH da empresa, que poderá solicitar os dados de vendas de funcionários para o pagamento de comissões. Sistemas geradores de Notas Fiscais e de Pagamentos poderão ser interligados aos dados das vendas. Além disso, o cadastro de produtos e estoque pode servir a um futuro sistema de Marketplace a ser implementado na empresa.

# 3. Telas
Link Quant-UX para teste:
https://www.quant-ux.com/#/share.html?h=a2aa10aTpZ4wmYruVKzsH5HoZTC3OFqDrJhAioaZRO2xzLWuYrYyo8PcKwqu

# 4. Requisitos do Sistema

4.1 Requisitos Funcionais (RF) e Regras de negócio (RN)

RF.001 - O sistema deve permitir cadastrar produto. (CRUD)

RN.001 - O cadastro de produto deve ter os seguinte campos:
● Código produto (campo obrigatório, auto-incremental);
● Categoria (campo obrigatório);
● Descrição (campo obrigatório);
● Preço (campo obrigatório);
● Quantidade em estoque (campo obrigatório);
● Imagem produto.

RF.002 - O sistema deve permitir cadastrar o cliente.
RN.002 - O cadastro do cliente deve ter os seguinte campos:
● CPF do cliente (campo obrigatório);
● Nome (campo obrigatório);
● Data nascimento (campo obrigatório);
● Endereço (campo obrigatório);
● E-mail (campo obrigatório);
● Telefone (campo obrigatório);
● Observações
RN.003 - No campo CPF, criar a rotina de validar CPF.
● Fórmula: pegar fórmula internet

RF.003 - O sistema deve permitir cadastrar o funcionário.

RN.004 - O cadastro do funcionário deve ter os seguinte campos:
● CPF do funcionário (campo obrigatório);
● Nome (campo obrigatório);
● Data nascimento (campo obrigatório);
● Endereço (campo obrigatório);
● E-mail (campo obrigatório);
● Telefone (campo obrigatório);
● Salário (campo obrigatório);
● Código Categoria (campo obrigatório);
○ Selecionar: Atendente (1), Caixa (2), Gerente (3), Serviços Gerais (4), Financeiro (5) e Outros (6).

● Vendas*
○ Somente para atendente
● Período (campo obrigatório);
○ matutino ou vespertino
● Data da contratação (campo obrigatório);
○ Máscara: data DD/MM/AAAA
● Status (ativo, férias, ausência);
● Observações.

RN.005 - No campo CPF, criar a rotina de validar CPF.
● Fórmula: pegar fórmula internet

RF.004 - O sistema deve permitir cadastro de categoria de produto.

RN.006 - O cadastro de cadastro de categoria de produto deve ter os seguinte campos:

● Código (auto-incremental);
● Nome (campo obrigatório);
● Descrição.

RF.005 - O sistema deve permitir cadastro de venda.

RN.007 - O cadastro de cadastro de venda deve ter os seguinte campos:
● Código da venda (auto-incremental);
● Data de venda (campo obrigatório);
○ Máscara: data DD/MM/AAAA
● Valor total (campo obrigatório);
● Número do cupom de desconto;
● Código do produto (campo obrigatório);
● Quantidade de produtos (campo obrigatório);
● Forma de pagamento (campo obrigatório);
○ Selecionar: Cartão de crédito parcelado, cartão de crédito á vista, cartão de débito, dinheiro
● CPF do cliente (campo obrigatório);
● CPF do caixa (campo obrigatório);
● CPF do atendente (campo obrigatório);

RN.008 - O sistema deverá validar se o funcionário está logado e se a categoria permite fazer vendas;

RN.009 - O sistema deve enviar um e-mail para o cliente com a nota fiscal da venda;

RN.010 - O sistema deverá validar o cupom de desconto dentro da data de validade;

RN.011 - O sistema deverá calcular o valor de desconto de acordo com o tempo de cadastro, criando um cupom de desconto;

RN.012 - O valor total da venda deverá ser calculado somando o valor total dos produtos subtraídos pela porcentagem de desconto;

RN.013 - O sistema deverá registrar o valor da venda no cadastro do atendente, para posterior cálculo de comissão;

RF.006 - O sistema deve permitir criar avisos para os clientes sobre cupons de desconto

RN.014 - O sistema de avisar o cliente que recebeu um cupom de desconto informando a data de validade do cupom;

RN.015- O gerente poderá definir um valor_desconto e tempo_desconto nas configurações do sistemas;

RF.007 - O sistema deve permitir cadastrar a configuração do sistema

RN.016 - O cadastro da configuração de sistemas deve ter os seguintes campos:

● Valor do desconto (campo obrigatório);
○ valor_desconto
● Tempo para ser habilitado ao desconto (campo obrigatório);
○ tempo_desconto

RN.008 - O sistema deverá emitir um relatório de vendas em um período definido pelo usuário.

4.2 Requisitos Não Funcionais (RNF)

● Usabilidade

RNF.001 - O Sistema deve possuir uma interface gráfica intuitiva para o funcionário;

RNF.002 - O sistema deve permitir a utilização de teclas de atalhos;

● Segurança

RNF.002 - Gerar um log de todas as transações realizadas: usuário, transação e data.

RNF.003 - Acesso a informações somente administrador do sistema e dentro do IP da loja.

● Portabilidade

RNF.006 - O sistema deve ser compatível com a versão do Chrome (103) e Firefox (106.0.4).

RNF.007 - O sistema deve ser compatível com a criptografia SSL de 64 bits na transmissão de dados via internet.

RNF.008 - O sistema deve suportar até 10 funcionários simultâneos.

RNF.009 - O sistema deve persistir os dados no SGDB - MYSQL, que permita backup e restore os dados.

RNF.010 - O tamanho dos discos de dados devem permitir escalabilidade do sistema a longo prazo;

● Desempenho

RNF.011 - O sistema deverá emitir um relatório de vendas em 5 segundos;

RNF.012 - O sistema deverá efetivar o cadastro em no máximo 2 segundos;


# 5. Diagramas de Casos de Uso

Link Online Visual Paradigm:
https://online.visual-paradigm.com/share.jsp?id=323238313435392d34

# 6. Diagrama de Entidade-Relacionamento (DER)

Link para diagrama em maior resolução:
https://drive.google.com/file/d/1r_fbDViY01YvD_IgXgkPGACQJ1ChIhFA/view?usp=sharing

# 7. Scripts SQL
Link para arquivo SQL:
https://drive.google.com/file/d/1Ql9DbYJJtjGwg9bLmIFMbBKPaJJBrRTT/view?usp=sharing
Link para arquivo TXT:
https://drive.google.com/file/d/1nyeaww3TsfDKQDuj_GRtXeKzDLShZ0BU/view?usp=share_link
