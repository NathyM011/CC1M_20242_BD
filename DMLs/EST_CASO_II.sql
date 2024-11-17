use est_caso_ii;

#####INSERTS#####
############# TABELA PASSAGEIROS #############
INSERT INTO passageiros (passageiros_cpf, passageiros_nome, passageiros_telefone, passageiros_cidade, passageiros_estado, passageiros_pais, passageiros_cep, passageiros_numero)
VALUES
('12345678901', 'João Silva', '(11)91234-5678', 'São Paulo', 'SP', 'Brasil', '01000-000', '123'),
('98765432100', 'Maria Oliveira', '(21)99876-5432', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000', '456'),
('13579246801', 'Carlos Pereira', '(31)98765-4321', 'Belo Horizonte', 'MG', 'Brasil', '30000-000', '789');

############# TABELA AEROPORTOS #############
INSERT INTO aeroportos (aeroportos_id, aeroportos_nome, aeroportos_cidade, aeroportos_estado, aeroportos_pais, aeroportos_cep)
VALUES
(1, 'Aeroporto Internacional de São Paulo', 'São Paulo', 'SP', 'Brasil', '01010-000'),
(2, 'Aeroporto Santos Dumont', 'Rio de Janeiro', 'RJ', 'Brasil', '20010-000'),
(3, 'Aeroporto Internacional de Belo Horizonte', 'Belo Horizonte', 'MG', 'Brasil', '30010-000');

############# TABELA AERONAVES #############
INSERT INTO aeronaves (aeronaves_id, aeronaves_modelo, aeronaves_capacidade)
VALUES
(1, 'Boeing 737', 180),
(2, 'Airbus A320', 200),
(3, 'Embraer E175', 90);

############# TABELA VOOS #############
INSERT INTO voos (voos_id, voos_id_aeroporto_origem, voos_id_aeroporto_destino, voos_horario_partida, voos_horario_chegada, voos_id_aeronave)
VALUES
(1, 1, 2, '2024-12-01 08:00:00', '2024-12-01 09:30:00', 1),
(2, 2, 3, '2024-12-02 10:00:00', '2024-12-02 11:30:00', 2),
(3, 1, 3, '2024-12-03 12:00:00', '2024-12-03 13:30:00', 3);

############# TABELA FUNCIONARIOS #############
INSERT INTO funcionarios (funcionarios_id, funcionarios_nome, funcionarios_cargo, funcionarios_cidade, funcionarios_estado, funcionarios_pais, funcionarios_cep, funcionarios_numero)
VALUES
(1, 'Ana Souza', 'Piloto', 'São Paulo', 'SP', 'Brasil', '01010-001', '12'),
(2, 'Lucas Costa', 'Co-piloto', 'Rio de Janeiro', 'RJ', 'Brasil', '20010-001', '34'),
(3, 'Carlos Lima', 'Comissário', 'Belo Horizonte', 'MG', 'Brasil', '30010-001', '56');

############# TABELA RESERVAS #############
INSERT INTO reservas (reservas_id, reservas_id_passageiro, reservas_id_voo, reservas_data_reserva)
VALUES
(1, '12345678901', 1, '2024-11-15 10:00:00'),
(2, '98765432100', 2, '2024-11-16 11:00:00'),
(3, '13579246801', 3, '2024-11-17 12:00:00');

############# TABELA OPERACOES_DE_VOO #############
INSERT INTO operacoes_de_voo (operacoes_id, operacoes_id_voo, operacoes_id_funcionario, operacoes_funcao)
VALUES
(1, 1, 1, 'Piloto'),
(2, 2, 2, 'Co-piloto'),
(3, 3, 3, 'Comissário');

####UPDATES######
############# TABELA PASSAGEIROS #############
UPDATE passageiros
SET passageiros_telefone = '(11)98765-4321'
WHERE passageiros_cpf = '12345678901';

############# TABELA AEROPORTOS #############
UPDATE aeroportos
SET aeroportos_cep = '01020-000'
WHERE aeroportos_id = 1;

############# TABELA AERONAVES #############
UPDATE aeronaves
SET aeronaves_capacidade = 190
WHERE aeronaves_id = 1;

############# TABELA VOOS #############
UPDATE voos
SET voos_horario_partida = '2024-12-01 09:00:00'
WHERE voos_id = 1;

############# TABELA FUNCIONARIOS #############
UPDATE funcionarios
SET funcionarios_cargo = 'Comissário'
WHERE funcionarios_id = 1;

############# TABELA RESERVAS #############
UPDATE reservas
SET reservas_data_reserva = '2024-11-16 14:00:00'
WHERE reservas_id = 1;

############# TABELA OPERACOES_DE_VOO #############
UPDATE operacoes_de_voo
SET operacoes_funcao = 'Comissário'
WHERE operacoes_id = 1;

####DELETES#####
############# TABELA RESERVAS #############
DELETE FROM reservas
WHERE reservas_id_voo IN (SELECT voos_id FROM voos WHERE voos_id_aeroporto_destino = 3);

############# TABELA PASSAGEIROS #############
DELETE FROM passageiros
WHERE passageiros_cpf = '13579246801';

############# TABELA OPERACOES_DE_VOO #############
DELETE FROM operacoes_de_voo
WHERE operacoes_id_voo IN (SELECT voos_id FROM voos WHERE voos_id_aeroporto_destino = 3);

############# TABELA VOOS #############
DELETE FROM voos
WHERE voos_id_aeroporto_destino = 3;

############# TABELA AERONAVES #############
DELETE FROM aeronaves
WHERE aeronaves_id = 3;

############# TABELA FUNCIONARIOS #############
DELETE FROM funcionarios
WHERE funcionarios_id = 3;

############# TABELA AEROPORTOS #############
DELETE FROM aeroportos
WHERE aeroportos_id = 3;







