create schema EST_CASO_V;
use EST_CASO_V;

create table if not exists clientes (
    clientes_id int primary key,
    clientes_nome varchar(100) not null,
    clientes_cpf char(11) unique not null,
    clientes_data_nascimento date not null,
    clientes_cidade varchar(100) not null,
    clientes_estado varchar(100) not null,
    clientes_pais varchar(100) not null,
    clientes_cep varchar(20) not null,
    clientes_numero varchar(10),
    clientes_telefone varchar(15) not null,
    clientes_email varchar(100) not null,
    clientes_programa_fidelidade boolean default false
);
alter table clientes add clientes_limite_credito decimal(10, 2);
alter table clientes change clientes_limite_credito clientes_credito_maximo decimal(10, 2);
alter table clientes modify clientes_credito_maximo decimal(12, 2);
alter table clientes drop column clientes_credito_maximo;

create table if not exists fornecedores (
    fornecedores_cnpj char(14) primary key,
    fornecedores_nome varchar(100) not null,
    fornecedores_telefone varchar(15) not null,
    fornecedores_email varchar(100) not null,
    fornecedores_cidade varchar(100) not null,
    fornecedores_estado varchar(100) not null,
    fornecedores_pais varchar(100) not null,
    fornecedores_cep varchar(20) not null,
    fornecedores_numero varchar(10)
);
alter table fornecedores add fornecedores_tipo_parceria varchar(50);
alter table fornecedores change fornecedores_tipo_parceria fornecedores_categoria varchar(50);
alter table fornecedores modify fornecedores_categoria varchar(100);
alter table fornecedores drop column fornecedores_categoria;

create table if not exists produtos (
    produtos_id int primary key,
    produtos_nome varchar(100) not null,
    produtos_categoria varchar(50) not null,
    produtos_preco decimal(10, 2) not null,
    produtos_quantidade_estoque int not null,
    fornecedores_id char(14) not null,
    constraint fk_produtos_fornecedores foreign key (fornecedores_id) references fornecedores(fornecedores_cnpj)
);
alter table produtos add produtos_data_validade date;
alter table produtos change produtos_data_validade produtos_validade date;
alter table produtos modify produtos_validade datetime;
alter table produtos drop column produtos_validade;

create table if not exists vendas (
    vendas_id int primary key,
    clientes_id int not null,
    vendas_data date not null,
    vendas_valor_total decimal(10, 2) not null,
    vendas_desconto decimal(10, 2),
    vendas_valor_final decimal(10, 2) not null,
    constraint fk_vendas_clientes foreign key (clientes_id) references clientes(clientes_id)
);
alter table vendas add vendas_tipo_entrega varchar(50);
alter table vendas change vendas_tipo_entrega vendas_modo_envio varchar(50);
alter table vendas modify vendas_modo_envio varchar(100);
alter table vendas drop column vendas_modo_envio;

create table if not exists produtos_vendas (
    produtos_id int not null,
    vendas_id int not null,
    produtos_vendas_quantidade int not null,
    produtos_vendas_preco_unitario decimal(10, 2) not null,
    constraint fk_produtos_vendas_produtos foreign key (produtos_id) references produtos(produtos_id),
    constraint fk_produtos_vendas_vendas foreign key (vendas_id) references vendas(vendas_id),
    primary key (produtos_id, vendas_id)
);
alter table produtos_vendas add produtos_vendas_garantia int;
alter table produtos_vendas change produtos_vendas_garantia produtos_vendas_periodo_garantia int;
alter table produtos_vendas modify produtos_vendas_periodo_garantia varchar(10);
alter table produtos_vendas drop column produtos_vendas_periodo_garantia;

create table if not exists pagamentos (
    pagamentos_id int primary key,
    vendas_id int not null,
    pagamentos_data date not null,
    pagamentos_valor decimal(10, 2) not null,
    pagamentos_status varchar(20) not null,
    pagamentos_forma varchar(50) not null,
    constraint fk_pagamentos_vendas foreign key (vendas_id) references vendas(vendas_id)
);
alter table pagamentos add pagamentos_referencia varchar(50);
alter table pagamentos change pagamentos_referencia pagamentos_cod_referencia varchar(50);
alter table pagamentos modify pagamentos_cod_referencia varchar(100);
alter table pagamentos drop column pagamentos_cod_referencia;

create table if not exists promocoes (
    promocoes_id int primary key,
    promocoes_nome varchar(100) not null,
    promocoes_descricao text,
    promocoes_data_inicio date not null,
    promocoes_data_fim date,
    promocoes_desconto decimal(5, 2)
);
drop table promocoes;


