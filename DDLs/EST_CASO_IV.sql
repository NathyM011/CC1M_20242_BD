create schema EST_CASO_IV;
use EST_CASO_IV;

create table if not exists alunos (
    alunos_id int primary key,
    alunos_nome varchar(100) not null,
    alunos_cpf char(11) unique not null,
    alunos_data_nascimento date not null,
    alunos_cidade varchar(100) not null,
    alunos_estado varchar(100) not null,
    alunos_pais varchar(100) not null,
    alunos_cep varchar(20) not null,
    alunos_numero varchar(10),
    alunos_telefone varchar(15) not null,
    alunos_email varchar(100) not null
);
alter table alunos add alunos_tipo_plano varchar(50);
alter table alunos change alunos_tipo_plano alunos_categoria_plano varchar(50);
alter table alunos modify alunos_categoria_plano varchar(100);
alter table alunos drop column alunos_categoria_plano;

create table if not exists instrutores (
    instrutores_id int primary key,
    instrutores_nome varchar(100) not null,
    instrutores_cpf char(11) unique not null,
    instrutores_especialidade varchar(50) not null,
    instrutores_data_admissao date not null,
    instrutores_telefone varchar(15) not null,
    instrutores_email varchar(100) not null,
    instrutores_cidade varchar(100) not null,
    instrutores_estado varchar(100) not null,
    instrutores_pais varchar(100) not null,
    instrutores_cep varchar(20) not null,
    instrutores_numero varchar(10) 
);
alter table instrutores add instrutores_nivel_experiencia varchar(20);
alter table instrutores change instrutores_nivel_experiencia instrutores_experiencia varchar(20);
alter table instrutores modify instrutores_experiencia varchar(50);
alter table instrutores drop column instrutores_experiencia;

create table if not exists modalidades (
    modalidades_id int primary key,
    modalidades_nome varchar(50) not null,
    modalidades_descricao text not null,
    modalidades_duracao int not null,
    modalidades_capacidade int not null
);
alter table modalidades add modalidades_calorias_estimadas int;
alter table modalidades change modalidades_calorias_estimadas modalidades_calorias_por_aula int;
alter table modalidades modify modalidades_calorias_por_aula decimal(5,2);
alter table modalidades drop column modalidades_calorias_por_aula;

create table if not exists alunos_modalidades (
    alunos_id int not null,
    modalidades_id int not null,
    constraint fk_alunos_modalidades_aluno foreign key (alunos_id) references alunos(alunos_id),
    constraint fk_alunos_modalidades_modalidade foreign key (modalidades_id) references modalidades(modalidades_id),
    primary key (alunos_id, modalidades_id)
);
alter table alunos_modalidades add alunos_modalidades_data_matricula date;
alter table alunos_modalidades change alunos_modalidades_data_matricula alunos_modalidades_data_inscricao date;
alter table alunos_modalidades modify alunos_modalidades_data_inscricao datetime;
alter table alunos_modalidades drop column alunos_modalidades_data_inscricao;

create table if not exists planos_treinamento (
    planos_id int primary key,
    alunos_id int not null,
    instrutores_id int not null,
    planos_descricao text not null,
    planos_data_inicio date not null,
    planos_data_fim date not null,
    constraint fk_planos_treinamento_aluno foreign key (alunos_id) references alunos(alunos_id),
    constraint fk_planos_treinamento_instrutor foreign key (instrutores_id) references instrutores(instrutores_id)
);
alter table planos_treinamento add planos_treinamento_frequencia varchar(20);
alter table planos_treinamento change planos_treinamento_frequencia planos_treinamento_periodicidade varchar(20);
alter table planos_treinamento modify planos_treinamento_periodicidade varchar(30);
alter table planos_treinamento drop column planos_treinamento_periodicidade;

create table if not exists aulas (
    aulas_id int primary key,
    modalidades_id int not null,
    instrutores_id int not null,
    aulas_data date not null,
    aulas_horario time not null,
    aulas_capacidade int not null,
    constraint fk_aulas_modalidade foreign key (modalidades_id) references modalidades(modalidades_id),
    constraint fk_aulas_instrutor foreign key (instrutores_id) references instrutores(instrutores_id)
);
alter table aulas add aulas_duracao int;
alter table aulas change aulas_duracao aulas_tempo_total int;
alter table aulas modify aulas_tempo_total varchar(10);
alter table aulas drop column aulas_tempo_total;

create table if not exists alunos_aulas (
    aulas_id int not null,
    alunos_id int not null,
    constraint fk_alunos_aulas_aula foreign key (aulas_id) references aulas(aulas_id),
    constraint fk_alunos_aulas_aluno foreign key (alunos_id) references alunos(alunos_id),
    primary key (aulas_id, alunos_id)
);
alter table alunos_aulas add alunos_aulas_nota_avaliacao int;
alter table alunos_aulas change alunos_aulas_nota_avaliacao alunos_aulas_feedback int;
alter table alunos_aulas modify alunos_aulas_feedback varchar(10);
alter table alunos_aulas drop column alunos_aulas_feedback;

create table if not exists pagamentos (
    pagamentos_id int primary key,
    alunos_id int not null,
    pagamentos_data date not null,
    pagamentos_valor decimal(10, 2) not null,
    pagamentos_status varchar(20) not null,
    constraint fk_pagamentos_aluno foreign key (alunos_id) references alunos(alunos_id)
);
alter table pagamentos add pagamentos_metodo varchar(20);
alter table pagamentos change pagamentos_metodo pagamentos_forma varchar(20);
alter table pagamentos modify pagamentos_forma varchar(30);
alter table pagamentos drop column pagamentos_forma;

create table if not exists avaliacoes_fisicas (
    avaliacoes_id int primary key,
    alunos_id int not null,
    instrutores_id int not null,
    avaliacoes_data date not null,
    avaliacoes_peso decimal(5, 2),
    avaliacoes_imc decimal(4, 2),
    avaliacoes_observacoes text,
    constraint fk_avaliacoes_alunos foreign key (alunos_id) references alunos(alunos_id),
    constraint fk_avaliacoes_instrutores foreign key (instrutores_id) references instrutores(instrutores_id)
);
drop table avaliacoes_fisicas;


