use EST_CASO_I;

############# TABELA FORNECEDORES #############
INSERT INTO fornecedores (forn_cod, forn_nome, forn_rua, forn_num, forn_bairro, forn_cidade, forn_estado, forn_pais, forn_cep, forn_telefone, forn_contato)
VALUES 
(1, 'Fornecedor 1', 'Rua São Jorge', 12, 'Centro', 'Vitória', 'ES', 'Brasil', '29.345.643', '(27)99935-5574', 'João Vitor'),
(2, 'Fornecedor 2', 'Rua Sete', 45, 'Ana Paula', 'São Paulo', 'SP', 'Brasil', '43.568.100', '(55)46835-6821', 'Marcelo'),
(3, 'Fornecedor 3', 'Rua Plínio', 671, 'Joana', 'Belo Horizonte', 'MG', 'Brasil', '35.684.856', '(19)35688-5674', 'Silva'),
(4, 'Fornecedor 4', 'Avenida Brasil', 1200, 'Centro', 'Rio de Janeiro', 'RJ', 'Brasil', '21.456.789', '(21)98765-4321', 'Carlos Eduardo'), 
(5, 'Fornecedor 5', 'Rua das Flores', 89, 'Jardim São Pedro', 'Curitiba', 'PR', 'Brasil', '41.789.234', '(41)97654-1234', 'Ana Carolina');

#### COMANDOS UPDATE ####
UPDATE fornecedores
SET forn_telefone = '(19)99999-8888'
WHERE forn_nome = 'Fornecedor 3';

UPDATE fornecedores
SET forn_contato = 'Maria Oliveira'
WHERE forn_nome = 'Fornecedor 5';

#### COMANDOS DELETE ####
DELETE FROM fornecedores
WHERE forn_nome = 'Fornecedor 2';

############# TABELA PEDIDOS #############
INSERT INTO pedidos (pedidos_cod, pedidos_data, pedidos_hora, predidos_previsao, pedidos_status, pedidos_fornecedores)
VALUES
(1, '2024-10-01', '14:30:00', '2024-10-05', 'Pendente', 1),
(2, '2024-10-02', '15:00:00', '2024-10-06', 'Pago', 3),
(3, '2024-10-03', '16:00:00', '2024-10-07', 'Entregue', 4),
(4, '2024-10-04', '17:30:00', '2024-10-08', 'Pendente', 5),
(5, '2024-10-05', '10:00:00', '2024-10-10', 'Pendente', 1);

#### COMANDOS UPDATE ####
UPDATE pedidos
SET pedidos_status = 'Entregue'
WHERE pedidos_cod = 1;

UPDATE pedidos
SET predidos_previsao = '2024-10-10'
WHERE pedidos_cod = 4;

#### COMANDOS DELETE ####
DELETE FROM pedidos
WHERE pedidos_cod = 2;

############# TABELA RECEBIMENTOS #############
INSERT INTO recebimentos (receb_data, receb_hora, receb_quant_prod, receb_condicao, receb_pedidos_cod)
VALUES
('2024-10-02', '14:30:00', 100.000, 'Produto entregue conforme pedido, em perfeito estado.', 1), 
('2024-10-03', '15:00:00', 50.500, 'Pagamento realizado, aguardando liberação para entrega.', 3),
('2024-10-04', '10:00:00', 200.000, 'Produtos entregues parcialmente, aguardando saldo.', 4),
('2024-10-05', '12:00:00', 150.000, 'Pedido entregue conforme acordado.', 1),
('2024-10-06', '09:00:00', 75.250, 'Produtos entregues e conferidos, todos em perfeito estado.', 5);

#### COMANDOS UPDATE ####
UPDATE recebimentos
SET receb_condicao = 'Produto entregue conforme combinado, tudo em ótimo estado.'
WHERE receb_pedidos_cod = 1;

UPDATE recebimentos
SET receb_quant_prod = 250.000
WHERE receb_pedidos_cod = 4;

#### COMANDOS DELETE ####
DELETE FROM recebimentos
WHERE receb_pedidos_cod = 3;

############# TABELA FILIAIS #############
INSERT INTO filiais (filiais_cod, filiais_nome, filiais_rua, filiais_num, filiais_bairro, filiais_cidade, filiais_estado, filiais_pais, filiais_cep, filiais_capacidade)
VALUES
(1, 'Filial Centro', 'Rua 1', 10, 'Centro', 'São Paulo', 'SP', 'Brasil', '01000-000', '5000 metros quadrados'),
(2, 'Filial Norte', 'Avenida das Nações', 120, 'Zona Norte', 'Rio de Janeiro', 'RJ', 'Brasil', '21000-000', '8000 metros quadrados'),
(3, 'Filial Sul', 'Rua das Flores', 300, 'Zona Sul', 'Curitiba', 'PR', 'Brasil', '80000-000', '6000 metros quadrados'),
(4, 'Filial Leste', 'Avenida Paulista', 400, 'Zona Leste', 'São Paulo', 'SP', 'Brasil', '03300-000', '10000 metros quadrados'),
(5, 'Filial Oeste', 'Rua do Porto', 600, 'Zona Oeste', 'Porto Alegre', 'RS', 'Brasil', '90000-000', '4000 metros quadrados');

#### COMANDOS UPDATE ####
UPDATE filiais
SET filiais_nome = 'Filial Sul Avançada'
WHERE filiais_cod = 3;

UPDATE filiais
SET filiais_capacidade = '6000 metros quadrados'
WHERE filiais_cod = 1;

#### COMANDOS DELETE ####
DELETE FROM filiais
WHERE filiais_cod = 2;

############# TABELA PRODUTOS ############
INSERT INTO produtos (prod_cod, prod_nome, prod_descricao, prod_espectec, prod_quant, prod_precounit, prod_unidademed, prod_estoq_min)
VALUES
(1, 'Produto A', 'Produto de alta qualidade, ideal para uso em grande escala.', 'Cor: Vermelho, Tamanho: Grande', 150.000, 50.00, 'unidade', 10.000),
(2, 'Produto B', 'Produto intermediário, utilizado para pequenas produções.', 'Cor: Azul, Tamanho: Médio', 100.000, 30.00, 'unidade', 5.000),
(3, 'Produto C', 'Produto premium, recomendado para clientes exigentes.', 'Cor: Verde, Tamanho: Pequeno', 200.000, 100.00, 'unidade', 15.000),
(4, 'Produto D', 'Produto econômico, ideal para revenda em grandes quantidades.', 'Cor: Amarelo, Tamanho: Grande', 50.000, 20.00, 'unidade', 7.500),
(5, 'Produto E', 'Produto de alta durabilidade, adequado para condições adversas.', 'Cor: Preto, Tamanho: Médio', 300.000, 75.00, 'unidade', 20.000);

#### COMANDOS UPDATE ####
UPDATE produtos
SET prod_descricao = 'Produto de excelente qualidade, recomendado para uso em larga escala.'
WHERE prod_cod = 1;

UPDATE produtos
SET prod_precounit = 90.00
WHERE prod_cod = 3;

#### COMANDOS DELETE ####
DELETE FROM produtos
WHERE prod_cod = 4;

############# TABELA PEDIDOS_PRODUTOS ############
INSERT INTO pedidos_produtos (pp_pedidos_cod, pp_produtos_cod, pp_produtos_quantidade)
VALUES
(1, 1, 10.000),
(1, 3, 5.000),
(2, 2, 20.000),
(3, 1, 15.000),
(4, 5, 30.000);

#### COMANDOS UPDATE ####
UPDATE pedidos_produtos
SET pp_produtos_quantidade = 12.000
WHERE pp_pedidos_cod = 1 AND pp_produtos_cod = 1;

UPDATE pedidos_produtos
SET pp_produtos_quantidade = 25.000
WHERE pp_pedidos_cod = 4 AND pp_produtos_cod = 5;

#### COMANDOS DELETE ####
DELETE FROM pedidos_produtos
WHERE pp_pedidos_cod = 2 AND pp_produtos_cod = 2;

############# TABELA FILIAIS_PRODUTOS ############
INSERT INTO filiais_produtos (fp_filiais_cod, fp_produtos_cod, fp_produtos_quant)
VALUES
(1, 1, 50.000),
(1, 2, 30.000),
(2, 1, 60.000),
(3, 3, 20.000),
(4, 5, 40.000);

#### COMANDOS UPDATE ####
UPDATE filiais_produtos
SET fp_produtos_quant = 70.000
WHERE fp_filiais_cod = 1 AND fp_produtos_cod = 1;

UPDATE filiais_produtos
SET fp_produtos_quant = 45.000
WHERE fp_filiais_cod = 4 AND fp_produtos_cod = 5;

#### COMANDOS DELETE ####
DELETE FROM filiais_produtos
WHERE fp_filiais_cod = 1 AND fp_produtos_cod = 1;

############# TABELA FORNECEDORES_PRODUTOS ############
INSERT INTO fornecedores_produtos (forprod_fornecedores_cod, forprod_produtos_cod)
VALUES
(1, 1),
(1, 2), 
(2, 3), 
(3, 1),
(4, 5);

#### COMANDOS UPDATE ####
UPDATE fornecedores_produtos
SET forprod_produtos_cod = 3
WHERE forprod_fornecedores_cod = 1 AND forprod_produtos_cod = 2;

UPDATE fornecedores_produtos
SET forprod_produtos_cod = 1
WHERE forprod_fornecedores_cod = 4 AND forprod_produtos_cod = 5;

#### COMANDOS DELETE ####
DELETE FROM fornecedores_produtos
WHERE forprod_fornecedores_cod = 3 AND forprod_produtos_cod = 1;

