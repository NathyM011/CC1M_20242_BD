create schema EST_CASO_I;
use EST_CASO_I;

create table if not exists fornecedores(
	forn_cod int primary key,
    forn_nome varchar(15) not null,
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

#### COMANDOS ALTER - TABELA FORNECEDOR ####
ALTER TABLE fornecedores ADD email VARCHAR(100);
ALTER TABLE fornecedores CHANGE COLUMN email forn_email VARCHAR(100);
ALTER TABLE fornecedores MODIFY COLUMN forn_email VARCHAR(45) not null;
ALTER TABLE fornecedores DROP COLUMN forn_email;

create table if not exists pedidos(
	pedidos_cod int primary key,
    pedidos_data date not null,
    pedidos_hora time not null,
    predidos_previsao date not null,
    pedidos_status enum ('Pago', 'Pendente', 'Entregue'),
    pedidos_fornecedores int,
	constraint fk_ped_fornecedores foreign key (pedidos_fornecedores) references fornecedores (forn_cod)
);

#### COMANDOS ALTER - TABELA PEDIDOS ####
ALTER TABLE pedidos ADD quantidade_pedidos float;
ALTER TABLE pedidos CHANGE COLUMN quantidade_pedidos pedidos_quantidade float;
ALTER TABLE pedidos MODIFY COLUMN pedidos_quantidade int not null;
ALTER TABLE pedidos DROP COLUMN pedidos_quantidade;

create table if not exists recebimentos(
	receb_data date not null,
    receb_hora time not null,
    receb_quant_prod decimal(10,3) not null,
    receb_condicao text not null,
    receb_pedidos_cod int,
    constraint fk_receb_pedidos foreign key (receb_pedidos_cod) references pedidos (pedidos_cod)
);

#### COMANDOS ALTER - TABELA RECEBIMENTOS ####
ALTER TABLE recebimentos ADD status_recebimentos text;
ALTER TABLE recebimentos CHANGE COLUMN status_recebimentos receb_status text;
ALTER TABLE recebimentos MODIFY COLUMN receb_status enum ('Recebido','Pendente') not null;
ALTER TABLE recebimentos DROP COLUMN receb_status;

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

#### COMANDOS ALTER - TABELA FILIAIS ####
ALTER TABLE filiais ADD gerente_filial varchar(100);
ALTER TABLE filiais CHANGE COLUMN gerente_filial filiais_gerente varchar(100);
ALTER TABLE filiais MODIFY COLUMN filiais_gerente varchar(45) not null;
ALTER TABLE filiais DROP COLUMN filiais_gerente;

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

#### COMANDOS ALTER - TABELA PRODUTOS ####
ALTER TABLE produtos ADD pais_fabricacao varchar(100);
ALTER TABLE produtos CHANGE COLUMN pais_fabricacao prod_paisfabric varchar(100);
ALTER TABLE produtos MODIFY COLUMN prod_paisfabric varchar(45) not null;
ALTER TABLE produtos DROP COLUMN prod_paisfabric;

create table if not exists pedidos_produtos(
	pp_pedidos_cod int,
    pp_produtos_cod int,
    constraint fk_pp_pedidos foreign key (pp_pedidos_cod) references pedidos (pedidos_cod),
	constraint fk_pp_produtos foreign key (pp_produtos_cod) references produtos (prod_cod),
    pp_produtos_quantidade decimal(10,3) not null
);

#### COMANDOS ALTER - TABELA PEDIDOS_PRODUTOS ####
ALTER TABLE pedidos_produtos ADD quantidade_produtos float;
ALTER TABLE pedidos_produtos CHANGE COLUMN quantidade_produtos pp_quant_prod float;
ALTER TABLE pedidos_produtos MODIFY COLUMN pp_quant_prod int not null;
ALTER TABLE pedidos_produtos DROP COLUMN pp_quant_prod;

create table if not exists filiais_produtos(
	fp_filiais_cod int,
    fp_produtos_cod int,
    
    constraint fk_fp_filiais foreign key (fp_filiais_cod) references filiais (filiais_cod),
	constraint fk_fp_produtos foreign key (fp_produtos_cod) references produtos (prod_cod),

    fp_produtos_quant decimal(10,3) not null
);

#### COMANDOS ALTER - TABELA FILIAIS_PRODUTOS ####
ALTER TABLE filiais_produtos ADD estoque_filial int;
ALTER TABLE filiais_produtos CHANGE COLUMN estoque_filial fp_capacidade_max_estoque int;
ALTER TABLE filiais_produtos MODIFY COLUMN fp_capacidade_max_estoque int not null;
ALTER TABLE filiais_produtos DROP COLUMN fp_capacidade_max_estoque;

create table if not exists fornecedores_produtos(
	forprod_fornecedores_cod int,
    forprod_produtos_cod int,
    constraint fk_forprod_fornecedores foreign key (forprod_fornecedores_cod) references fornecedores (forn_cod),
	constraint fk_forprod_produtos foreign key (forprod_produtos_cod) references produtos (prod_cod)
);

#### COMANDOS ALTER - TABELA FORNECEDORES_PRODUTOS ####
ALTER TABLE fornecedores_produtos ADD pais_origem char not null;
ALTER TABLE fornecedores_produtos CHANGE COLUMN pais_origem forprod_pais_origem char;
ALTER TABLE fornecedores_produtos MODIFY COLUMN forprod_pais_origem varchar(45) not null;
ALTER TABLE fornecedores_produtos DROP COLUMN forprod_pais_origem;

#### CRIAÇAÕ DE TABELA ADICIONAL ####
create table if not exists clientes(
	clientes_cod int primary key,
	clientes_nome varchar(45) not null,
    clientes_datanasc date not null
);
drop table clientes;