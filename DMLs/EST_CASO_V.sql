use EST_CASO_V;

####INSERTS####
INSERT INTO clientes (
    clientes_id, 
    clientes_nome, 
    clientes_cpf, 
    clientes_data_nascimento, 
    clientes_cidade, 
    clientes_estado, 
    clientes_pais, 
    clientes_cep, 
    clientes_numero, 
    clientes_telefone, 
    clientes_email, 
    clientes_programa_fidelidade
) 
VALUES
(1, 'João Silva', '12345678901', '1985-05-15', 'São Paulo', 'SP', 'Brasil', '01000-000', '123', '(11)91234-5678', 'joao.silva@email.com', true),
(2, 'Maria Oliveira', '98765432100', '1992-10-20', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000', '456', '(21)98765-4321', 'maria.oliveira@email.com', false),
(3, 'Carlos Lima', '56789012345', '1990-03-25', 'Belo Horizonte', 'MG', 'Brasil', '30000-000', '789', '(31)99876-5432', 'carlos.lima@email.com', true);

INSERT INTO fornecedores (
    fornecedores_cnpj, 
    fornecedores_nome, 
    fornecedores_telefone, 
    fornecedores_email, 
    fornecedores_cidade, 
    fornecedores_estado, 
    fornecedores_pais, 
    fornecedores_cep, 
    fornecedores_numero
) 
VALUES
('12345678000100', 'Fornecedor A', '(11)12345-6789', 'fornecedorA@email.com', 'São Paulo', 'SP', 'Brasil', '01010-000', '10'),
('98765432000199', 'Fornecedor B', '(21)98765-4321', 'fornecedorB@email.com', 'Rio de Janeiro', 'RJ', 'Brasil', '20020-000', '20'),
('11122233000122', 'Fornecedor C', '(31)99876-5432', 'fornecedorC@email.com', 'Belo Horizonte', 'MG', 'Brasil', '30030-000', '30');

INSERT INTO produtos (
    produtos_id, 
    produtos_nome, 
    produtos_categoria, 
    produtos_preco, 
    produtos_quantidade_estoque, 
    fornecedores_id
) 
VALUES
(1, 'Produto A', 'Categoria 1', 100.00, 50, '12345678000100'),
(2, 'Produto B', 'Categoria 2', 200.00, 30, '98765432000199'),
(3, 'Produto C', 'Categoria 1', 150.00, 20, '11122233000122');

INSERT INTO vendas (
    vendas_id, 
    clientes_id, 
    vendas_data, 
    vendas_valor_total, 
    vendas_desconto, 
    vendas_valor_final
) 
VALUES
(1, 1, '2024-11-01', 300.00, 50.00, 250.00),
(2, 2, '2024-11-05', 500.00, 100.00, 400.00),
(3, 3, '2024-11-10', 450.00, 50.00, 400.00);

INSERT INTO produtos_vendas (
    produtos_id, 
    vendas_id, 
    produtos_vendas_quantidade, 
    produtos_vendas_preco_unitario
) 
VALUES
(1, 1, 2, 100.00),
(2, 2, 1, 200.00),
(3, 3, 2, 150.00);

INSERT INTO pagamentos (
    pagamentos_id, 
    vendas_id, 
    pagamentos_data, 
    pagamentos_valor, 
    pagamentos_status, 
    pagamentos_forma
) 
VALUES
(1, 1, '2024-11-01', 250.00, 'Pago', 'Cartão de Crédito'),
(2, 2, '2024-11-05', 400.00, 'Pendente', 'Boleto'),
(3, 3, '2024-11-10', 400.00, 'Pago', 'Pix');

####UPDATES####
UPDATE clientes 
SET clientes_telefone = '(11)91234-5679', 
    clientes_email = 'joao.silva.novo@email.com', 
    clientes_programa_fidelidade = true 
WHERE clientes_id = 1;

UPDATE fornecedores 
SET fornecedores_telefone = '(21)98765-4322', 
    fornecedores_email = 'fornecedorA.novo@email.com' 
WHERE fornecedores_cnpj = '12345678000100';

UPDATE produtos 
SET produtos_preco = 110.00, 
    produtos_quantidade_estoque = 60 
WHERE produtos_id = 1;

UPDATE vendas 
SET vendas_desconto = 75.00, 
    vendas_valor_final = vendas_valor_total - vendas_desconto 
WHERE vendas_id = 1;

UPDATE produtos_vendas 
SET produtos_vendas_quantidade = 3, 
    produtos_vendas_preco_unitario = 105.00 
WHERE produtos_id = 1 AND vendas_id = 1;

UPDATE pagamentos 
SET pagamentos_status = 'Confirmado', 
    pagamentos_valor = 270.00 
WHERE pagamentos_id = 1;

####DELETES####
DELETE FROM produtos_vendas 
WHERE produtos_id = 1 AND vendas_id = 1;

DELETE FROM pagamentos 
WHERE pagamentos_id = 1;

DELETE FROM vendas 
WHERE vendas_id = 1;

DELETE FROM clientes 
WHERE clientes_id = 1;

DELETE FROM produtos 
WHERE produtos_id = 1;

DELETE FROM fornecedores 
WHERE fornecedores_cnpj = '12345678000100';

