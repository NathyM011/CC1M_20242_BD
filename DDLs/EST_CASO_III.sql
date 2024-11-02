create schema EST_CASO_III;
use EST_CASO_III;

create table if not exists clientes(
	clientes_cnpj char(14) primary key,
    clientes_razao_social varchar(100) not null,
    clientes_ramo_atividade varchar(50) not null,
    clientes_data_cadastramento date not null,
    clientes_pessoa_contato varchar(100) not null
);
alter table clientes add clientes_credito_limitado decimal(10, 2);
alter table clientes change clientes_credito_limitado clientes_limite_credito decimal(10, 2);
alter table clientes modify clientes_limite_credito decimal(12, 2);
alter table clientes drop column clientes_limite_credito;

####CAMPO MULTIVALORADO####
create table if not exists clientes_telefones (
    clientes_telefones_id int primary key,
    clientes_id char(14) not null,
    clientes_telefone varchar(15) not null,
    constraint fk_clientes_telefones foreign key (clientes_id) references clientes(clientes_cnpj)
);
alter table clientes_telefones add clientes_telefones_tipo varchar(20);
alter table clientes_telefones change clientes_telefones_tipo clientes_telefones_categoria varchar(20);
alter table clientes_telefones modify clientes_telefones_categoria varchar(30);
alter table clientes_telefones drop column clientes_telefones_categoria;

create table if not exists empregados (
    empregados_matricula int primary key,
    empregados_nome varchar(100) not null,
    empregados_cargo varchar(50) not null,
    empregados_salario decimal(10, 2) not null,
    empregados_data_admissao date not null,
    empregados_qualificacoes varchar(255) not null
);
alter table empregados add empregados_turno varchar(20);
alter table empregados change empregados_turno empregados_periodo varchar(20);
alter table empregados modify empregados_periodo varchar(30);
alter table empregados drop column empregados_periodo;

####CAMPO MULTIVALORADO####
create table if not exists empregados_telefones (
    empregados_telefones_id int primary key,
    empregados_matricula int not null,
    empregados_telefone varchar(15) not null,
    constraint fk_empregados_telefones foreign key (empregados_matricula) references empregados(empregados_matricula)
);
alter table empregados_telefones add empregados_telefones_observacao varchar(50);
alter table empregados_telefones change empregados_telefones_observacao empregados_telefones_notas varchar(50);
alter table empregados_telefones modify empregados_telefones_notas varchar(100);
alter table empregados_telefones drop column empregados_telefones_notas;


create table if not exists empresas (
    empresas_cnpj char(14) primary key,
    empresas_razao_social varchar(100) not null,
    empresas_pessoa_contato varchar(100) not null
);
alter table empresas add empresas_site varchar(100);
alter table empresas change empresas_site empresas_website varchar(100);
alter table empresas modify empresas_website varchar(150);
alter table empresas drop column empresas_website;


####CAMPO MULTIVALORADO####
create table if not exists empresas_telefones (
    empresas_telefones_id int primary key,
    empresas_cnpj char(14) not null,
    empresas_telefone varchar(15) not null,
    constraint fk_empresas_telefones foreign key (empresas_cnpj) references empresas(empresas_cnpj)
);
alter table empresas_telefones add empresas_telefones_informacao varchar(50);
alter table empresas_telefones change empresas_telefones_informacao empresas_telefones_descricao varchar(50);
alter table empresas_telefones modify empresas_telefones_descricao varchar(100);
alter table empresas_telefones drop column empresas_telefones_descricao;


create table if not exists fornecedores (
    fornecedores_cnpj char(14) primary key,
    fornecedores_razao_social varchar(100) not null,
    fornecedores_pessoa_contato varchar(100) not null
);
alter table fornecedores add fornecedores_categoria varchar(50);
alter table fornecedores change fornecedores_categoria fornecedores_tipo varchar(50);
alter table fornecedores modify fornecedores_tipo varchar(100);
alter table fornecedores drop column fornecedores_tipo;

####CAMPO MULTIVALORADO####
create table if not exists fornecedores_telefones (
    fornecedores_telefones_id int primary key,
    fornecedores_cnpj char(14) not null,
    fornecedores_telefone varchar(15) not null,
    constraint fk_fornecedores_telefones foreign key (fornecedores_cnpj) references fornecedores(fornecedores_cnpj)
);
alter table fornecedores_telefones add fornecedores_telefones_nota varchar(50);
alter table fornecedores_telefones change fornecedores_telefones_nota fornecedores_telefones_comentario varchar(50);
alter table fornecedores_telefones modify fornecedores_telefones_comentario varchar(100);
alter table fornecedores_telefones drop column fornecedores_telefones_comentario;


create table if not exists tipo_endereco (
    tipo_endereco_codigo int primary key,
    tipo_endereco_nome varchar(50) not null
);
alter table tipo_endereco add tipo_endereco_descricao varchar(100);
alter table tipo_endereco change tipo_endereco_descricao tipo_endereco_detalhes varchar(100);
alter table tipo_endereco modify tipo_endereco_detalhes varchar(150);
alter table tipo_endereco drop column tipo_endereco_detalhes;

create table if not exists enderecos (
    enderecos_id int auto_increment primary key,
    tipo_endereco_codigo int not null,
    clientes_cnpj char(14) not null,
    enderecos_logradouro varchar(100) not null,
    enderecos_complemento varchar(100),
    enderecos_cep varchar(20) not null,
    enderecos_bairro varchar(50) not null,
    enderecos_cidade varchar(50) not null,
    enderecos_estado varchar(50) not null,
    enderecos_numero varchar(10),
    constraint fk_enderecos_tipo_endereco foreign key (tipo_endereco_codigo) references tipo_endereco(tipo_endereco_codigo),
	constraint fk_enderecos_clientes foreign key (clientes_cnpj) references clientes(clientes_cnpj)
);
alter table enderecos add enderecos_tipo_residencia varchar(50);
alter table enderecos change enderecos_tipo_residencia enderecos_tipo_imovel varchar(50);
alter table enderecos modify enderecos_tipo_imovel varchar(100);
alter table enderecos drop column enderecos_tipo_imovel;

create table if not exists encomendas (
    encomendas_numero int primary key,
    clientes_id char(14) not null,
    encomendas_data_inclusao date not null,
    encomendas_valor_total decimal(10, 2) not null,
    encomendas_valor_desconto decimal(10, 2),
    encomendas_valor_liquido decimal(10, 2) not null,
    encomendas_forma_pagamento_id int not null,
    encomendas_quantidade_parcelas int not null,
    constraint fk_encomendas_cliente foreign key (clientes_id) references clientes(clientes_cnpj)
);
alter table encomendas add encomendas_taxa_servico decimal(10, 2);
alter table encomendas change encomendas_taxa_servico encomendas_custo_servico decimal(10, 2);
alter table encomendas modify encomendas_custo_servico decimal(12, 2);
alter table encomendas drop column encomendas_custo_servico;

create table if not exists produtos (
    produtos_codigo int primary key,
    produtos_nome varchar(100) not null,
    produtos_cor varchar(30) not null,
    produtos_dimensoes varchar(50)not null,
    produtos_peso decimal(5, 2) not null,
    produtos_preco decimal(10, 2) not null,
    produtos_tempo_fabricacao int not null,
    produtos_desenho text not null,
    produtos_horas_mao_obra int not null
);
alter table produtos add produtos_garantia_meses int;
alter table produtos change produtos_garantia_meses produtos_periodo_garantia int;
alter table produtos modify produtos_periodo_garantia varchar(20);
alter table produtos drop column produtos_periodo_garantia;

create table if not exists tipos_componentes (
    tipos_componentes_codigo int primary key,
    tipos_componentes_nome varchar(50) not null
);
alter table tipos_componentes add tipos_componentes_fabricante varchar(50);
alter table tipos_componentes change tipos_componentes_fabricante tipos_componentes_marca varchar(50);
alter table tipos_componentes modify tipos_componentes_marca varchar(100);
alter table tipos_componentes drop column tipos_componentes_marca;

create table if not exists componentes (
    componentes_codigo int primary key,
    tipos_componentes_codigo int not null,
    componentes_nome varchar(100) not null,
    componentes_quantidade_estoque int not null,
    componentes_preco_unitario decimal(10, 2) not null,
    componentes_unidade varchar(20) not null,
    constraint fk_componentes_tipo_componente foreign key (tipos_componentes_codigo) references tipos_componentes(tipos_componentes_codigo)
);
alter table componentes add componentes_data_validade date;
alter table componentes change componentes_data_validade componentes_validade date;
alter table componentes modify componentes_validade datetime;
alter table componentes drop column componentes_validade;

create table if not exists maquinas (
    maquinas_id int primary key,
    maquinas_tempo_vida int not null,
    maquinas_data_compra date not null,
    maquinas_data_fim_garantia date not null
);
alter table maquinas add maquinas_fabricante varchar(100);
alter table maquinas change maquinas_fabricante maquinas_marca varchar(100);
alter table maquinas modify maquinas_marca varchar(150);
alter table maquinas drop column maquinas_marca;

create table if not exists recursos_especificos (
    recursos_especificos_id int primary key,
    recursos_especificos_quantidade_necessaria int not null,
    recursos_especificos_unidade varchar(20) not null,
    recursos_especificos_tempo_uso int not null,
    recursos_especificos_horas_mao_obra int not null
);
alter table recursos_especificos add recursos_especificos_tempo_espera int;
alter table recursos_especificos change recursos_especificos_tempo_espera recursos_especificos_intervalo_uso int;
alter table recursos_especificos modify recursos_especificos_intervalo_uso varchar(20);
alter table recursos_especificos drop column recursos_especificos_intervalo_uso;

create table if not exists registro_manutencao (
    registro_manutencao_id int primary key,
    registro_manutencao_data date not null,
    registro_manutencao_descricao text not null
);
alter table registro_manutencao add registro_manutencao_custo decimal(10, 2);
alter table registro_manutencao change registro_manutencao_custo registro_manutencao_valor decimal(10, 2);
alter table registro_manutencao modify registro_manutencao_valor decimal(12, 2);
alter table registro_manutencao drop column registro_manutencao_valor;

create table if not exists registro_suprimentos (
    registro_suprimentos_id int primary key,
    registro_suprimentos_quantidade int not null,
    registro_suprimentos_data_necessidade date not null
);
alter table registro_suprimentos add registro_suprimentos_prioridade varchar(20);
alter table registro_suprimentos change registro_suprimentos_prioridade registro_suprimentos_urgencia varchar(20);
alter table registro_suprimentos modify registro_suprimentos_urgencia varchar(30);
alter table registro_suprimentos drop column registro_suprimentos_urgencia;

create table if not exists projetos (
    projetos_id int primary key,
    projetos_nome varchar(100) not null,
    projetos_descricao text not null,
    projetos_data_inicio date not null,
    projetos_data_fim date not null,
    projetos_status varchar(20) not null
);
alter table projetos add projetos_orcamento decimal(10, 2);
alter table projetos change projetos_orcamento projetos_custo_estimado decimal(10, 2);
alter table projetos modify projetos_custo_estimado decimal(12, 2);
alter table projetos drop column projetos_custo_estimado;

drop table projetos;