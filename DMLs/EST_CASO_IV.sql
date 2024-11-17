use EST_CASO_IV;

####INSERTS####
INSERT INTO alunos (
    alunos_id, 
    alunos_nome, 
    alunos_cpf, 
    alunos_data_nascimento, 
    alunos_cidade, 
    alunos_estado, 
    alunos_pais, 
    alunos_cep, 
    alunos_numero, 
    alunos_telefone, 
    alunos_email
) 
VALUES
(1, 'João Silva', '12345678901', '2000-05-15', 'São Paulo', 'SP', 'Brasil', '01000-000', '123', '(11)91234-5678', 'joao.silva@email.com'),
(2, 'Maria Oliveira', '98765432100', '1995-10-20', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000', '456', '(21)98765-4321', 'maria.oliveira@email.com'),
(3, 'Carlos Lima', '56789012345', '1998-03-25', 'Belo Horizonte', 'MG', 'Brasil', '30000-000', '789', '(31)99876-5432', 'carlos.lima@email.com');

INSERT INTO instrutores (
    instrutores_id, 
    instrutores_nome, 
    instrutores_cpf, 
    instrutores_especialidade, 
    instrutores_data_admissao, 
    instrutores_telefone, 
    instrutores_email, 
    instrutores_cidade, 
    instrutores_estado, 
    instrutores_pais, 
    instrutores_cep, 
    instrutores_numero
) 
VALUES
(1, 'Ana Costa', '12345678900', 'Yoga', '2020-01-15', '(11)91234-5678', 'ana.costa@email.com', 'São Paulo', 'SP', 'Brasil', '01000-000', '123'),
(2, 'Paulo Santos', '98765432111', 'Musculação', '2019-06-20', '(21)98765-4321', 'paulo.santos@email.com', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000', '456'),
(3, 'Mariana Lima', '56789012344', 'Pilates', '2021-03-10', '(31)99876-5432', 'mariana.lima@email.com', 'Belo Horizonte', 'MG', 'Brasil', '30000-000', '789');

INSERT INTO modalidades (
    modalidades_id, 
    modalidades_nome, 
    modalidades_descricao, 
    modalidades_duracao, 
    modalidades_capacidade
) 
VALUES
(1, 'Yoga', 'Aulas de yoga para melhorar a flexibilidade, equilíbrio e relaxamento.', 60, 20),
(2, 'Musculação', 'Treinamento de força e resistência utilizando equipamentos e pesos livres.', 90, 15),
(3, 'Pilates', 'Exercícios focados em postura, alongamento e fortalecimento muscular.', 75, 12);

INSERT INTO alunos_modalidades (
    alunos_id, 
    modalidades_id
) 
VALUES
(1, 1),
(2, 2),
(3, 3); 

INSERT INTO planos_treinamento (
    planos_id, 
    alunos_id, 
    instrutores_id, 
    planos_descricao, 
    planos_data_inicio, 
    planos_data_fim
) 
VALUES
(1, 1, 1, 'Treinamento de resistência e fortalecimento muscular com foco em membros inferiores.', '2024-11-20', '2025-02-20'),
(2, 2, 2, 'Plano de treino cardiovascular combinado com musculação para perda de peso.', '2024-12-01', '2025-03-01'),
(3, 3, 3, 'Treino de flexibilidade e equilíbrio com práticas de yoga e pilates.', '2024-11-25', '2025-02-25');

INSERT INTO aulas (
    aulas_id, 
    modalidades_id, 
    instrutores_id, 
    aulas_data, 
    aulas_horario, 
    aulas_capacidade
) 
VALUES
(1, 1, 1, '2024-11-22', '08:00:00', 15),
(2, 2, 2, '2024-11-23', '10:00:00', 20),
(3, 3, 3, '2024-11-24', '18:00:00', 10);

INSERT INTO alunos_aulas (
    aulas_id, 
    alunos_id
) 
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO pagamentos (
    pagamentos_id, 
    alunos_id, 
    pagamentos_data, 
    pagamentos_valor, 
    pagamentos_status
) 
VALUES
(1, 1, '2024-11-01', 150.00, 'Pago'),    
(2, 2, '2024-11-05', 200.00, 'Pendente'), 
(3, 3, '2024-11-10', 250.00, 'Atrasado');  

####UPDATES####
UPDATE alunos 
SET alunos_nome = 'João Pedro Silva', 
    alunos_telefone = '(11)91234-5679', 
    alunos_email = 'joao.silva@example.com'
WHERE alunos_id = 1;

UPDATE instrutores 
SET instrutores_nome = 'Carlos Eduardo Oliveira', 
    instrutores_telefone = '(21)98765-4321', 
    instrutores_email = 'carlos.oliveira@example.com'
WHERE instrutores_id = 1;

UPDATE modalidades 
SET modalidades_nome = 'Pilates Avançado', 
    modalidades_descricao = 'Aulas de Pilates para nível avançado', 
    modalidades_duracao = 60, 
    modalidades_capacidade = 15
WHERE modalidades_id = 1;

UPDATE alunos_modalidades 
SET modalidades_id = 2
WHERE alunos_id = 1 AND modalidades_id = 1;

UPDATE planos_treinamento 
SET planos_descricao = 'Plano de treinamento para emagrecimento', 
    planos_data_inicio = '2024-11-20', 
    planos_data_fim = '2024-12-20'
WHERE planos_id = 1;

UPDATE aulas 
SET aulas_horario = '10:00:00', 
    aulas_capacidade = 20
WHERE aulas_id = 1;

UPDATE alunos_aulas 
SET aulas_id = 2 
WHERE alunos_id = 1 AND aulas_id = 1;

UPDATE pagamentos 
SET pagamentos_valor = 250.00, 
    pagamentos_status = 'Pendente'
WHERE pagamentos_id = 1;

####DELETES####
DELETE FROM alunos_aulas WHERE alunos_id = 1;
DELETE FROM alunos_modalidades WHERE alunos_id = 1;
DELETE FROM planos_treinamento WHERE alunos_id = 1;
DELETE FROM pagamentos WHERE alunos_id = 1;
DELETE FROM alunos WHERE alunos_id = 1;
DELETE FROM aulas WHERE aulas_id = 1;
DELETE FROM instrutores WHERE instrutores_id = 1;
DELETE FROM modalidades WHERE modalidades_id = 1;


