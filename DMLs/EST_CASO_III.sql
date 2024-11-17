use EST_CASO_III;

####INSERTS####
INSERT INTO tipo_endereco (tipo_endereco_codigo, tipo_endereco_nome) 
VALUES 
(1, 'Residencial'),
(2, 'Comercial'),
(3, 'Industrial'),
(4, 'Rural'),
(5, 'Outros');

INSERT INTO enderecos (enderecos_id, tipo_endereco_codigo, clientes_cnpj, enderecos_logradouro, enderecos_complemento, enderecos_cep, enderecos_bairro, enderecos_cidade, enderecos_estado, enderecos_numero)
VALUES
(1, 1, '12345678000195', 'Rua A', 'Apto 101', '01000-000', 'Centro', 'São Paulo', 'SP', '123'),
(2, 2, '98765432000110', 'Avenida B', 'Sala 202', '20000-000', 'Zona Sul', 'Rio de Janeiro', 'RJ', '456'),
(3, 3, '12398765000121', 'Estrada C', NULL, '30000-000', 'Jardim das Flores', 'Belo Horizonte', 'MG', '789');

INSERT INTO clientes (clientes_cnpj, clientes_razao_social, clientes_ramo_atividade, clientes_data_cadastramento, clientes_pessoa_contato, enderecos_clientes)
VALUES
('12345678000195', 'Empresa XYZ Ltda', 'Comércio', '2024-11-17', 'Carlos Silva', 1),
('98765432000110', 'Indústria ABC S.A.', 'Indústria', '2024-10-10', 'Mariana Oliveira', 2),
('32165498000122', 'Tecnologia QRS', 'Tecnologia', '2024-09-05', 'Luiz Santos', 3);

INSERT INTO clientes_telefones (clientes_telefones_id, clientes_id, clientes_telefone)
VALUES
(1, '12345678000195', '(11)91234-5678'),
(2, '98765432000110', '(21)99876-5432'),
(3, '32165498000122', '(31)98765-4321');

INSERT INTO empregados (empregados_matricula, empregados_nome, empregados_cargo, empregados_salario, empregados_data_admissao, empregados_qualificacoes, endereco_empregados)
VALUES
(1, 'José Oliveira', 'Analista de Sistemas', 3500.00, '2022-03-15', 'Graduação em Ciência da Computação', 1),
(2, 'Maria Santos', 'Gerente de Projetos', 7500.00, '2021-06-10', 'MBA em Gestão de Projetos', 2),
(3, 'Carlos Lima', 'Desenvolvedor Backend', 4500.00, '2023-01-05', 'Graduação em Engenharia de Software', 3);

INSERT INTO empregados_telefones (empregados_telefones_id, empregados_matricula, empregados_telefone)
VALUES
(1, 1, '(11) 91234-5678'),
(2, 2, '(21) 98765-4321'),
(3, 3, '(31) 98877-1234');

INSERT INTO empresas (empresas_cnpj, empresas_razao_social, empresas_pessoa_contato, enderecos_empresas)
VALUES
('12345678000199', 'Tech Solutions Ltda', 'Carlos Oliveira', 1),
('98765432000100', 'Indústria Metalúrgica Brasil', 'Fernanda Pereira', 2),
('56789012345678', 'Comercial Global', 'Roberta Souza', 3);

INSERT INTO empresas_telefones (empresas_telefones_id, empresas_cnpj, empresas_telefone)
VALUES
(1, '12345678000199', '(11) 91234-5678'),
(2, '98765432000100', '(21) 99876-5432'),
(3, '56789012345678', '(31) 98765-4321');

INSERT INTO fornecedores (fornecedores_cnpj, fornecedores_razao_social, fornecedores_pessoa_contato, enderecos_fornecedores)
VALUES
('12345678000199', 'Fornecedor ABC Ltda', 'Carlos Silva', 1),
('98765432000100', 'Fornecedor XYZ S.A.', 'Fernanda Oliveira', 2),
('56789012345678', 'Fornecedora Global', 'João Pereira', 3);

INSERT INTO fornecedores_telefones (fornecedores_telefones_id, fornecedores_cnpj, fornecedores_telefone)
VALUES
(1, '12345678000199', '(11) 91234-5678'),
(2, '98765432000100', '(21) 99876-5432'),
(3, '56789012345678', '(31) 98765-4321');

INSERT INTO encomendas (encomendas_numero, clientes_id, encomendas_data_inclusao, encomendas_valor_total, encomendas_valor_desconto, encomendas_valor_liquido, encomendas_forma_pagamento_id, encomendas_quantidade_parcelas)
VALUES
(1, '12345678000195', '2024-11-01', 1500.00, 150.00, 1350.00, 1, 3),
(2, '98765432000110', '2024-11-05', 2500.00, 200.00, 2300.00, 2, 6),
(3, '32165498000122', '2024-11-10', 3500.00, 350.00, 3150.00, 3, 12);

INSERT INTO produtos (produtos_codigo, produtos_nome, produtos_cor, produtos_dimensoes, produtos_peso, produtos_preco, produtos_tempo_fabricacao, produtos_desenho, produtos_horas_mao_obra)
VALUES
(1, 'Cadeira de Escritório', 'Preta', '60x60x120 cm', 7.50, 250.00, 10, 'Cadeira ergonômica com apoio para os braços e ajustes de altura', 5),
(2, 'Mesa de Jantar', 'Branca', '180x90x75 cm', 25.00, 850.00, 15, 'Mesa de jantar retangular com 4 cadeiras', 12),
(3, 'Sofá 3 Lugares', 'Cinza', '210x90x80 cm', 40.00, 1200.00, 20, 'Sofá de 3 lugares com tecido confortável e resistente', 18);

INSERT INTO produtos_encomendados (produtos_id, encomendas_id, produtos_encomendados_quantidade) 
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3); 

INSERT INTO componentes (componentes_codigo, tipos_componentes_codigo, componentes_nome, componentes_quantidade_estoque, componentes_preco_unitario, componentes_unidade)
VALUES
(1, 1, 'Placa-mãe ATX', 50, 350.00, 'unidade'),
(2, 2, 'Memória RAM 8GB', 100, 180.00, 'unidade'),
(3, 3, 'Fonte 500W', 30, 220.00, 'unidade');

INSERT INTO tipos_componentes (tipos_componentes_codigo, tipos_componentes_nome, componentes_id)
VALUES
(1, 'Placa Mãe', 1),
(2, 'Memória RAM', 2),
(3, 'Fonte', 3);

INSERT INTO componentes_fornecedores (fornecedores_id, componentes_id)
VALUES
('12345678000199', 1), 
('98765432000100', 2),
('56789012345678', 3);

INSERT INTO maquinas (maquinas_id, maquinas_tempo_vida, maquinas_data_compra, maquinas_data_fim_garantia)
VALUES
(1, 10, '2015-06-01', '2025-06-01'),
(2, 8, '2018-03-15', '2026-03-15'),
(3, 12, '2012-11-22', '2024-11-22');

INSERT INTO recursos_especificos (recursos_especificos_id, recursos_especificos_quantidade_necessaria, recursos_especificos_unidade, recursos_especificos_tempo_uso, recursos_especificos_horas_mao_obra)
VALUES
(1, 50, 'unidade', 12, 10),
(2, 30, 'litro', 8, 15),
(3, 100, 'metro', 24, 20);

INSERT INTO registro_manutencao (registro_manutencao_id, registro_manutencao_data, registro_manutencao_descricao, maquinas_id)
VALUES
(1, '2024-10-01', 'Manutenção preventiva do motor da máquina A, verificação de componentes e troca de peças.', 1),
(2, '2024-11-05', 'Reparo no sistema hidráulico da máquina B, substituição de válvula danificada.', 2),
(3, '2024-11-15', 'Manutenção corretiva na máquina C, reparo na parte elétrica e testes de funcionamento.', 3);

INSERT INTO registro_suprimentos (registro_suprimentos_id, registro_suprimentos_quantidade, registro_suprimentos_data_necessidade)
VALUES
(1, 100, '2024-12-01'),
(2, 50, '2024-12-15'),
(3, 200, '2025-01-10');

INSERT INTO producao_produtos (
    prod_custo_producao, 
    prod_tempo_maodeobra, 
    empregados_id, 
    recursos_es_id, 
    componentes_id, 
    maquinas_id, 
    registros_suprimentos_id, 
    produtos_id
) 
VALUES
(1500.50, '02:30:00', 1, 1, 1, 1, 1, 1),
(2000.75, '03:00:00', 2, 2, 2, 2, 2, 2),
(2500.00, '04:15:00', 3, 3, 3, 3, 3, 3);

####UPDATES####
UPDATE tipo_endereco
SET tipo_endereco_nome = 'Residencial'
WHERE tipo_endereco_codigo = 1;

UPDATE enderecos
SET enderecos_bairro = 'Centro de São Paulo'
WHERE enderecos_id = 1;

UPDATE clientes
SET clientes_razao_social = 'Empresa XYZ Ltda Atualizada'
WHERE clientes_cnpj = '12345678000195';

UPDATE clientes_telefones
SET clientes_telefone = '(11)91234-5679'
WHERE clientes_telefones_id = 1;

UPDATE empregados
SET empregados_salario = 4000.00
WHERE empregados_matricula = 1;

UPDATE empregados_telefones
SET empregados_telefone = '(11) 91234-5679'
WHERE empregados_telefones_id = 1;

UPDATE empresas
SET empresas_razao_social = 'Tech Solutions Ltda Atualizada'
WHERE empresas_cnpj = '12345678000199';

UPDATE empresas_telefones
SET empresas_telefone = '(11) 99999-8888'
WHERE empresas_telefones_id = 1;

UPDATE fornecedores
SET fornecedores_razao_social = 'Fornecedor ABC Ltda Atualizada'
WHERE fornecedores_cnpj = '12345678000199';

UPDATE fornecedores_telefones
SET fornecedores_telefone = '(11) 98765-4321'
WHERE fornecedores_telefones_id = 1;

UPDATE encomendas
SET encomendas_valor_total = 1600.00
WHERE encomendas_numero = 1;

UPDATE produtos
SET produtos_preco = 260.00
WHERE produtos_codigo = 1;

UPDATE produtos_encomendados
SET produtos_encomendados_quantidade = 3
WHERE produtos_id = 1 AND encomendas_id = 1;

UPDATE componentes
SET componentes_preco_unitario = 375.00
WHERE componentes_codigo = 1;

UPDATE tipos_componentes
SET tipos_componentes_nome = 'Placa Mãe ATX'
WHERE tipos_componentes_codigo = 1;

UPDATE componentes_fornecedores
SET fornecedores_id = '98765432000100'
WHERE componentes_id = 1;

UPDATE maquinas
SET maquinas_tempo_vida = 12
WHERE maquinas_id = 1;

UPDATE recursos_especificos
SET recursos_especificos_quantidade_necessaria = 60
WHERE recursos_especificos_id = 1;

UPDATE registro_manutencao
SET registro_manutencao_descricao = 'Manutenção preventiva com troca de peças.'
WHERE registro_manutencao_id = 1;

UPDATE registro_suprimentos
SET registro_suprimentos_quantidade = 120
WHERE registro_suprimentos_id = 1;

UPDATE producao_produtos
SET prod_custo_producao = 1800.50
WHERE produtos_id = 1;

####DELETES####
DELETE FROM tipo_endereco
WHERE tipo_endereco_codigo = 5;

DELETE FROM clientes_telefones
WHERE clientes_telefones_id = 3;

DELETE FROM produtos_encomendados
WHERE produtos_id = 3 AND encomendas_id = 3;

DELETE FROM encomendas
WHERE encomendas_numero = 3;

DELETE FROM clientes
WHERE clientes_cnpj = '32165498000122';

DELETE FROM producao_produtos
WHERE produtos_id = 3;

DELETE FROM empregados_telefones
WHERE empregados_telefones_id = 3;

DELETE FROM empregados
WHERE empregados_matricula = 3;

DELETE FROM empresas_telefones
WHERE empresas_telefones_id = 3;

DELETE FROM empresas
WHERE empresas_cnpj = '56789012345678';

DELETE FROM fornecedores_telefones
WHERE fornecedores_telefones_id = 3;

DELETE FROM componentes_fornecedores
WHERE componentes_id = 3;

DELETE FROM fornecedores
WHERE fornecedores_cnpj = '56789012345678';

DELETE FROM produtos
WHERE produtos_codigo = 3;

DELETE FROM tipos_componentes
WHERE tipos_componentes_codigo = 3;

DELETE FROM componentes
WHERE componentes_codigo = 3;

DELETE FROM recursos_especificos
WHERE recursos_especificos_id = 3;

DELETE FROM registro_manutencao
WHERE registro_manutencao_id = 3;

DELETE FROM registro_suprimentos
WHERE registro_suprimentos_id = 3;

DELETE FROM maquinas
WHERE maquinas_id = 3;

DELETE FROM enderecos
WHERE enderecos_id = 3;












