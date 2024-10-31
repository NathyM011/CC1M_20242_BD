create schema est_caso_ii;
use est_caso_ii;

create table passageiros (
    passageiros_cpf char(11) primary key,
    passageiros_nome varchar(100) not null,
    passageiros_telefone varchar(15),
    passageiros_cidade varchar(100) not null,
    passageiros_estado varchar(100) not null,
    passageiros_pais varchar(100) not null,
    passageiros_cep varchar(20) not null,
    passageiros_numero varchar(10)
);

alter table passageiros add passageiros_nacionalidade varchar(50);
alter table passageiros change passageiros_nacionalidade passageiros_naturalidade varchar(50);
alter table passageiros modify passageiros_naturalidade varchar(100);
alter table passageiros drop column passageiros_naturalidade;

create table aeroportos (
    aeroportos_id int primary key,
    aeroportos_nome varchar(100) not null,
    aeroportos_cidade varchar(100) not null,
    aeroportos_estado varchar(100) not null,
    aeroportos_pais varchar(100) not null,
    aeroportos_cep varchar(20) not null
);

alter table aeroportos add aeroportos_terminal int;
alter table aeroportos change aeroportos_terminal aeroportos_terminal_principal int;
alter table aeroportos modify aeroportos_terminal_principal varchar(10);
alter table aeroportos drop column aeroportos_terminal_principal;

create table aeronaves (
    aeronaves_id int primary key,
    aeronaves_modelo varchar(50),
    aeronaves_capacidade int not null
);

alter table aeronaves add aeronaves_ano_fabricacao year;
alter table aeronaves change aeronaves_ano_fabricacao aeronaves_ano_modelo year;
alter table aeronaves modify aeronaves_ano_modelo varchar(4);
alter table aeronaves drop column aeronaves_ano_modelo;

create table voos (
    voos_id int primary key,
    voos_id_aeroporto_origem int not null,
    voos_id_aeroporto_destino int not null,
    voos_horario_partida datetime not null,
    voos_horario_chegada datetime not null,
    voos_id_aeronave int not null,
    constraint fk_voos_aeroporto_origem foreign key (voos_id_aeroporto_origem) references aeroportos(aeroportos_id),
    constraint fk_voos_aeroporto_destino foreign key (voos_id_aeroporto_destino) references aeroportos(aeroportos_id),
    constraint fk_voos_aeronave foreign key (voos_id_aeronave) references aeronaves(aeronaves_id)
);

alter table voos add voos_escala varchar(100);
alter table voos change voos_escala voos_paradas varchar(100);
alter table voos modify voos_paradas varchar(150);
alter table voos drop column voos_paradas;

create table funcionarios (
    funcionarios_id int primary key,
    funcionarios_nome varchar(100) not null,
    funcionarios_cargo varchar(50) not null,
    funcionarios_cidade varchar(100) not null,
    funcionarios_estado varchar(100) not null,
    funcionarios_pais varchar(100) not null,
    funcionarios_cep varchar(20) not null,
    funcionarios_numero varchar(10)
);

alter table funcionarios add funcionarios_turno varchar(20);
alter table funcionarios change funcionarios_turno funcionarios_periodo varchar(20);
alter table funcionarios modify funcionarios_periodo varchar(30);
alter table funcionarios drop column funcionarios_periodo;

create table reservas (
    reservas_id int primary key,
    reservas_id_passageiro varchar(11) not null,
    reservas_id_voo int not null,
    reservas_data_reserva datetime default current_timestamp,
    constraint fk_reservas_passageiro foreign key (reservas_id_passageiro) references passageiros(passageiros_cpf),
    constraint fk_reservas_voo foreign key (reservas_id_voo) references voos(voos_id)
);

alter table reservas add reservas_status varchar(20);
alter table reservas change reservas_status reservas_situacao varchar(20);
alter table reservas modify reservas_situacao varchar(30);
alter table reservas drop column reservas_situacao;

create table operacoes_de_voo (
    operacoes_id int primary key,
    operacoes_id_voo int not null,
    operacoes_id_funcionario int not null,
    operacoes_funcao varchar(50) not null, 
    constraint fk_operacoes_voo foreign key (operacoes_id_voo) references voos(voos_id),
    constraint fk_operacoes_funcionario foreign key (operacoes_id_funcionario) references funcionarios(funcionarios_id)
);

alter table operacoes_de_voo add operacoes_tipo_equipamento varchar(50);
alter table operacoes_de_voo change operacoes_tipo_equipamento operacoes_equipamento_utilizado varchar(50);
alter table operacoes_de_voo modify operacoes_equipamento_utilizado varchar(100);
alter table operacoes_de_voo drop column operacoes_equipamento_utilizado;

create table bagagens (
    bagagens_id int primary key,
    bagagens_id_reserva int not null,
    bagagens_peso decimal(5,2) not null,
    bagagens_tipo varchar(50) not null,
    bagagens_dimensoes varchar(50),
    constraint fk_bagagens_reserva foreign key (bagagens_id_reserva) references reservas(reservas_id)
);
drop table bagagens;
