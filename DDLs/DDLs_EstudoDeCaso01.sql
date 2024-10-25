create schema DDLS_PPORTF;
use DDLS_PPORTF;

create table if not exists fornecedores(
	forn_cod int primary key,
    forn_nome varchar(45) not null,
    forn_rua varchar(45) not null,
    forn_num int,
    forn_bairro varchar(45) not null,
    forn_cidade varchar(45) not null,
    forn_estado varchar(45) not null,
    forn_pais varchar(30) not null,
    forn_cep varchar(10) not null,
    forn_telefone varchar(15) not null,
    forn_contato text not null
);

create table if not exists pedidos(
	pedidos_cod int primary key,
    pedidos_data date not null,
    pedidos_hora time not null,
    predidos_previsao date not null,
    pedidos_status enum ('Pago', 'Pendente', 'Entregue'),
    pedidos_fornecedores int,
	constraint fk_ped_fornecedores foreign key (pedidos_fornecedores) references fornecedores (forn_cod)
);

create table if not exists recebimentos(
	receb_data date not null,
    receb_hora time not null,
    receb_quant_prod decimal(10,3) not null,
    receb_condicao text not null,
    receb_pedidos_cod int,
    constraint fk_receb_pedidos foreign key (receb_pedidos_cod) references pedidos (pedidos_cod)
);

create table if not exists filiais(
	filiais_cod int primary key,
    filiais_nome varchar(30) not null,
    filiais_rua varchar(100) not null,
    filiais_num int,
    filiais_bairro varchar(50) not null,
    filiais_cidade varchar(50) not null,
    filiais_estado varchar(50) not null,
    filiais_pais varchar(50) not null,
    filiais_cep varchar(10) not null,
    filiais_capacidade text not null
);

create table if not exists produtos(
	prod_cod int primary key,
    prod_nome varchar(50) not null,
    prod_descricao text not null,
    prod_espectec text not null,
    prod_quant decimal(10,3) not null,
    prod_precounit decimal(10,2) not null,
    prod_unidademed varchar(10) not null,
    prod_estoq_min decimal(10,3) not null
);

create table if not exists pedidos_produtos(
	pp_pedidos_cod int,
    pp_produtos_cod int,
    constraint fk_pp_pedidos foreign key (pp_pedidos_cod) references pedidos (pedidos_cod),
	constraint fk_pp_produtos foreign key (pp_produtos_cod) references produtos (prod_cod),
    pp_produtos_quantidade decimal(10,3) not null
);

create table if not exists filiais_produtos(
	fp_filiais_cod int,
    fp_produtos_cod int,
    
    constraint fk_fp_filiais foreign key (fp_filiais_cod) references filiais (filiais_cod),
	constraint fk_fp_produtos foreign key (fp_produtos_cod) references produtos (prod_cod),

    fp_produtos_quant decimal(10,3) not null-
);

create table if not exists fornecedores_produtos(
	forprod_fornecedores_cod int,
    forprod_produtos_cod int,
    constraint fk_forprod_fornecedores foreign key (forprod_fornecedores_cod) references fornecedores (forn_cod),
	constraint fk_forprod_produtos foreign key (forprod_produtos_cod) references produtos (prod_cod)
);
