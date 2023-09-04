-- criação de um banco de dados para um e-commerce

create database ecommerce;
use ecommerce;

create table cliente(
		idcliente int auto_increment primary key,
        pnome varchar(15),
        mnome char(3),
        unome varchar(15),
        cpf char(11) not null,
        endereco varchar(40),
        constraint unique_cpf_cliente unique(cpf)
);

create table produto(
		idproduto int primary key,
        nome varchar(15) not null,
        classificacao_crianca boolean default false,
        categoria enum('eletrônicos','roupas','brinquedos','alimentos') not null,
        cpf char(11) not null,
        avaliacao float default 0,
        tamanho varchar(15),
        constraint unique_cpf_cliente unique(cpf)
);

create table pedido(
		idpedido int auto_increment primary key,
		idpedidocliente int,
		pedidostatus enum('cancelado','confirmado','em processamento') default 'em processamento',
		descricao varchar(255),
		frete float default 10,
		constraint fk_pedido_cliente foreign key(idpedidocliente) references cliente(idcliente)
);

create table estoque(
		idestoque int auto_increment primary key,
        localidade varchar(15),
        quantidade int default 0
);

create table fornecedor(
		idfornecedor int auto_increment primary key,
        contato varchar(15) not null,
        razaosocial varchar(30) not null,
        cnpj char(15) not null,
        constraint unique_cnpj unique(cnpj)
);

create table vendedor(
		idvendedor int auto_increment primary key,
        cnpj char(15),
        cpf char(11),
        nomefantasia varchar(30),
        localidade varchar(30),
        contato varchar(15) not null,
        constraint unique_cnpj_vendedor unique(cnpj),
        constraint unique_cpf_vendedor unique(cpf)
);

create table produtosvendedor(
		idprodutosvendedor int,
        idproduto int,
        quantidade int not null,
        primary key(idprodutosvendedor, idproduto),
        constraint fk_produtos_vendedor foreign key(idprodutosvendedor) references vendedor(idvendedor),
        constraint fk_produto_produto foreign key(idproduto) references produto(idproduto)
);

show databases;
use ecommerce;
show tables;