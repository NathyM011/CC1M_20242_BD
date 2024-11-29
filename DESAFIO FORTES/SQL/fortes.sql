create schema fortes;
use fortes;

create table if not exists usuarios(
user_cod int primary key,
user_cnpj varchar(14) not null,
user_nome varchar(45) not null,
user_categoria tinyint not null, # 1 = donatário , 0 = funcionário
user_tel varchar(15) not null,
user_email varchar(100) not null,
user_razaoSocial varchar(45) not null
);

create table if not exists editais(
edital_cod int primary key,
edital_prazoInicio date not null,
edital_prazoFim date not null,
edital_descricao longtext not null
);

create table if not exists projetos(
proj_cod int primary key,
proj_nome varchar(45) not null,
proj_respTec varchar(45) not null,
proj_respCool varchar(45) not null,

cod_edital int not null,
constraint fk_edital foreign key (cod_edital) references editais(edital_cod)
);

create table if not exists relatorios(
relat_cod int primary key,
relat_data date not null,
relat_img blob,
relat_text longtext not null,
user_cod int not null,
proj_cod int not null,

CONSTRAINT FK_user_cod_relat FOREIGN KEY (user_cod) REFERENCES usuarios(user_cod),
constraint fk_projeto foreign key (proj_cod) references projetos(proj_cod)
);

create table if not exists propostas_pedidos(
prope_cod int primary key,
prope_valor dec(10,2) not null,

user_cod int not null,
proj_cod int not null,

CONSTRAINT FK_user_cod_prope FOREIGN KEY (user_cod) REFERENCES usuarios(user_cod),
constraint fk_projeto_prop foreign key (proj_cod) references projetos(proj_cod)
);

create table if not exists inscricao(
	cod_usuario int not null,
    cod_projeto int not null,
    primary key (cod_usuario, cod_projeto),
    
    constraint fk_usuario foreign key (cod_usuario) references usuarios(user_cod),
    constraint fk_projeto_insc foreign key (cod_projeto) references projetos(proj_cod)
);


INSERT INTO usuarios (user_cod, user_cnpj, user_nome, user_categoria, user_tel, user_email, user_razaoSocial) VALUES (1, '12000000000001', 'Marzena Laaksonen', 1, '1234-5678', 'email0@exemplo.com', 'Razão Social 1');
INSERT INTO usuarios (user_cod, user_cnpj, user_nome, user_categoria, user_tel, user_email, user_razaoSocial) VALUES (2, '12000000000002', 'Jairo Protázio', 0, '1234-5678', 'email1@exemplo.com', 'Razão Social 2');
INSERT INTO usuarios (user_cod, user_cnpj, user_nome, user_categoria, user_tel, user_email, user_razaoSocial) VALUES (3, '12000000000003', 'Berenice Zukowski', 1, '1234-5678', 'email2@exemplo.com', 'Razão Social 3');
INSERT INTO usuarios (user_cod, user_cnpj, user_nome, user_categoria, user_tel, user_email, user_razaoSocial) VALUES (4, '12000000000004', 'Aldo Mostafa', 0, '1234-5678', 'email3@exemplo.com', 'Razão Social 4');
INSERT INTO usuarios (user_cod, user_cnpj, user_nome, user_categoria, user_tel, user_email, user_razaoSocial) VALUES (5, '12000000000005', 'Mireille Cané', 1, '1234-5678', 'email4@exemplo.com', 'Razão Social 5');

INSERT INTO editais (edital_cod, edital_prazoInicio, edital_prazoFim, edital_descricao) VALUES (1, '2023-01-01', '2023-12-01', 'Descrição do Edital 1');
INSERT INTO editais (edital_cod, edital_prazoInicio, edital_prazoFim, edital_descricao) VALUES (2, '2023-01-02', '2023-12-02', 'Descrição do Edital 2');
INSERT INTO editais (edital_cod, edital_prazoInicio, edital_prazoFim, edital_descricao) VALUES (3, '2023-01-03', '2023-12-03', 'Descrição do Edital 3');
INSERT INTO editais (edital_cod, edital_prazoInicio, edital_prazoFim, edital_descricao) VALUES (4, '2023-01-04', '2023-12-04', 'Descrição do Edital 4');
INSERT INTO editais (edital_cod, edital_prazoInicio, edital_prazoFim, edital_descricao) VALUES (5, '2023-01-05', '2023-12-05', 'Descrição do Edital 5');

INSERT INTO projetos (proj_cod, proj_nome, proj_respTec, proj_respCool, cod_edital) VALUES (1, 'Projeto 1', 'Responsável Técnico 1', 'Responsável Cool 1', 1);
INSERT INTO projetos (proj_cod, proj_nome, proj_respTec, proj_respCool, cod_edital) VALUES (2, 'Projeto 2', 'Responsável Técnico 2', 'Responsável Cool 2', 2);
INSERT INTO projetos (proj_cod, proj_nome, proj_respTec, proj_respCool,cod_edital) VALUES (3,'Projeto 3','Responsável Técnico 3','Responsável Cool 3',3);
INSERT INTO projetos (proj_cod ,proj_nome ,proj_respTec ,proj_respCool ,cod_edital ) VALUES(4 ,'Projeto 4','Responsável Técnico 4','Responsável Cool 4' ,4);
INSERT INTO projetos(proj_cod ,proj_nome ,proj_respTec ,proj_respCool,cod_edital )VALUES(5 ,'Projeto 5','Responsável Técnico 5','Responsável Cool 5' ,5);

INSERT INTO relatorios (relat_cod, relat_data, relat_img, relat_text, user_cod, proj_cod) VALUES (1, '2023-06-01', NULL, 'Texto do Relatório 1', 1, 1);
INSERT INTO relatorios (relat_cod, relat_data, relat_img, relat_text, user_cod, proj_cod) VALUES (2, '2023-06-02', NULL, 'Texto do Relatório 2', 2, 2);
INSERT INTO relatorios (relat_cod, relat_data, relat_img, relat_text, user_cod, proj_cod) VALUES (3, '2023-06-03', NULL, 'Texto do Relatório 3', 3, 3);
INSERT INTO relatorios (relat_cod, relat_data, relat_img, relat_text, user_cod, proj_cod) VALUES (4, '2023-06-04', NULL, 'Texto do Relatório 4', 4, 4);
INSERT INTO relatorios (relat_cod, relat_data, relat_img, relat_text, user_cod, proj_cod) VALUES (5, '2023-06-05', NULL, 'Texto do Relatório 5', 5, 5);

INSERT INTO propostas_pedidos (prope_cod, prope_valor, user_cod, proj_cod) VALUES (1, 1000.00, 1, 1);
INSERT INTO propostas_pedidos (prope_cod, prope_valor, user_cod, proj_cod) VALUES (2, 2000.00, 2, 2);
INSERT INTO propostas_pedidos (prope_cod, prope_valor, user_cod, proj_cod) VALUES (3, 3000.00, 3, 3);
INSERT INTO propostas_pedidos (prope_cod ,prope_valor ,user_cod ,proj_cod )VALUES(4 ,4000.00 ,4 ,4 );
INSERT INTO propostas_pedidos(prope_cod ,prope_valor ,user_cod ,proj_cod )VALUES(5 ,5000.00 ,5 ,5 );

INSERT INTO inscricao (cod_usuario,cod_projeto )VALUES(1 ,1 );
INSERT INTO inscricao(cod_usuario,cod_projeto )VALUES(2 ,2 );
INSERT INTO inscricao(cod_usuario,cod_projeto )VALUES(3 ,3 );
INSERT INTO inscricao(cod_usuario,cod_projeto )VALUES(4 ,4 );
INSERT INTO inscricao(cod_usuario,cod_projeto )VALUES(5 ,5 );