#### COMANDOS INSERT - TABELA FORNECEDORES ####
insert into fornecedores (forn_nome, forn_rua, forn_num, forn_bairro, forn_cidade, forn_estado, forn_pais, forn_cep, forn_telefone, forn_contato)
values 
('Fornecedor 1', 'Rua São Jorge', 12, 'Centro', 'Vitória', 'ES', 'Brasil', '29.345.643', '(27)99935-5574', 'João Vitor'),
('Fornecedor 2', 'Rua Sete', 45, 'Ana Paula', 'São Paulo', 'SP', 'Brasil', '43.568.100', '(55)46835-6821', 'Marcelo'),
('Fornecedor 3', 'Rua Plínio', 671, 'Joana', 'Belo Horizonte', 'MG', 'Brasil', '35.684.856', '(19)35688-5674', 'Silva'),
('Fornecedor 4', 'Avenida Brasil', 1200, 'Centro', 'Rio de Janeiro', 'RJ', 'Brasil', '21.456.789', '(21)98765-4321', 'Carlos Eduardo'), 
('Fornecedor 5', 'Rua das Flores', 89, 'Jardim São Pedro', 'Curitiba', 'PR', 'Brasil', '41.789.234', '(41)97654-1234', 'Ana Carolina');

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


