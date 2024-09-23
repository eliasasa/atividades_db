create database if not exists atv_avl_09;
use atv_avl_09;

/*
Cria um banco de dados com os seguintes tabelas:
Clientes, Agências, Cidade, Estado, Gênero, Raça, Religião, Saque, Depósito 
Na tabela clientes deve constar os dados  do cliente, Nome, CPF, RG, Data Nascimento, fone, endereço, conectados nas tabelas Cidade, Estado, Gênero, Raça, Religião, Estado Civil e Agências. Também deverá constar o saldo, e o número da conta.
Na tabela Agências, deverá constar o numero da agência, o endereço, interligados nas tabelas Cidade e Estado.
Na tabela Saque deverá constar o Id da operação, o Id da Agência, o Id da Conta do cliente, o valor do saque. Deverá ter uma trigger que efetue a subtração na conta do cliente.
Na tabela Depósito deverá constar o Id da operação, o Id da Agência, o Id da Conta do cliente, o valor do saque. Deverá ter uma trigger que efetue a adição do valor na conta do cliente.
*/

create table if not exists estado (
	id_estado int primary key auto_increment,
    nome_estado varchar(255) not null
);

create table if not exists cidade (
	id_cidade int primary key auto_increment,
    nome_cidade varchar(255) not null,
	id_estadofk int not null, foreign key (id_estadofk) references estado(id_estado)
);

create table if not exists endereco (
	id_endereco int primary key auto_increment,
    id_cidadefk int, foreign key (id_cidadefk) references cidade(id_cidade),
    bairro varchar(255),
    rua varchar(255),
    num_casa varchar(255)
);

create table if not exists agencia (
	id_agencia int primary key auto_increment,
    nome_agencia varchar(255) not null,
    num_agencia varchar(3) not null unique,
    id_cidade_agenciafk int not null, foreign key (id_cidade_agenciafk) references cidade(id_cidade)
);

create table if not exists genero (
	id_genero int primary key auto_increment,
    nome_genero varchar(255) not null unique
);

create table if not exists raca (
	id_raca int primary key auto_increment,
    nome_raca varchar(255) not null unique
);

create table if not exists religiao (
	id_religiao int primary key auto_increment,
    nome_religiao varchar(255) not null unique
);

create table if not exists estado_civil (
	id_estado_civil int primary key auto_increment,
    nome_estado_civil varchar(255) not null unique
);

create table if not exists cliente (
	id_cliente int primary key auto_increment,
	nome varchar(255) not null,
    cpf varchar(14) not null unique,
    rg varchar(15) not null unique,
    data_nasc date not null,
    fone varchar(20) not null unique,
    enderecofk int not null, foreign key (enderecofk) references endereco(id_endereco),
    generofk int not null, foreign key (generofk) references genero(id_genero),
    racafk int not null, foreign key (racafk) references raca(id_raca),
    religiaofk int not null, foreign key (religiaofk) references religiao(id_religiao),
    estado_civilfk int not null, foreign key (estado_civilfk) references estado_civil(id_estado_civil),
    agenciafk varchar(3) not null, foreign key (agenciafk) references agencia(num_agencia),
    saldo float not null
);

create table if not exists saque (
    id_operacao int primary key auto_increment,
    conta int, foreign key (conta) references cliente(id_cliente),
    saque float not null
);

create table if not exists deposito (
    id_operacao int primary key auto_increment,
    conta int, foreign key (conta) references cliente(id_cliente),
    deposito float not null
);

-- Inserindo estados
INSERT INTO estado (nome_estado) VALUES
('Acre'),
('Alagoas'),
('Amapá'),
('Amazonas'),
('Bahia'),
('Ceará'),
('Distrito Federal'),
('Espírito Santo'),
('Goiás'),
('Maranhão'),
('Mato Grosso'),
('Mato Grosso do Sul'),
('Minas Gerais'),
('Pará'),
('Paraíba'),
('Paraná'),
('Pernambuco'),
('Piauí'),
('Rio de Janeiro'),
('Rio Grande do Norte'),
('Rio Grande do Sul'),
('Rondônia'),
('Roraima'),
('Santa Catarina'),
('São Paulo'),
('Sergipe'),
('Tocantins');

-- Inserindo cidades
INSERT INTO cidade (nome_cidade, id_estadofk) VALUES
-- Acre
('Rio Branco', 1),
('Cruzeiro do Sul', 1),
('Senador Guiomard', 1),

-- Alagoas
('Maceió', 2),
('Arapiraca', 2),
('Palmeira dos Índios', 2),

-- Amapá
('Macapá', 3),
('Santana', 3),
('Laranjal do Jari', 3),

-- Amazonas
('Manaus', 4),
('Parintins', 4),
('Itacoatiara', 4),

-- Bahia
('Salvador', 5),
('Feira de Santana', 5),
('Vitória da Conquista', 5),

-- Ceará
('Fortaleza', 6),
('Caucaia', 6),
('Maracanaú', 6),

-- Distrito Federal
('Brasília', 7),
('Gama', 7),
('Taguatinga', 7),

-- Espírito Santo
('Vitória', 8),
('Vila Velha', 8),
('Cariacica', 8),

-- Goiás
('Goiânia', 9),
('Aparecida de Goiânia', 9),
('Anápolis', 9),

-- Maranhão
('São Luís', 10),
('Imperatriz', 10),
('Caxias', 10),

-- Mato Grosso
('Cuiabá', 11),
('Várzea Grande', 11),
('Rondonópolis', 11),

-- Mato Grosso do Sul
('Campo Grande', 12),
('Dourados', 12),
('Três Lagoas', 12),

-- Minas Gerais
('Belo Horizonte', 13),
('Contagem', 13),
('Juiz de Fora', 13),

-- Pará
('Belém', 14),
('Ananindeua', 14),
('Santarém', 14),

-- Paraíba
('João Pessoa', 15),
('Campina Grande', 15),
('Patos', 15),

-- Paraná
('Curitiba', 16),
('Londrina', 16),
('Ponta Grossa', 16),

-- Pernambuco
('Recife', 17),
('Olinda', 17),
('Jaboatão dos Guararapes', 17),

-- Piauí
('Teresina', 18),
('Parnaíba', 18),
('Picos', 18),

-- Rio de Janeiro
('Rio de Janeiro', 19),
('Niterói', 19),
('Duque de Caxias', 19),

-- Rio Grande do Norte
('Natal', 20),
('Mossoró', 20),
('Caicó', 20),

-- Rio Grande do Sul
('Porto Alegre', 21),
('Canoas', 21),
('Santa Maria', 21),

-- Rondônia
('Porto Velho', 22),
('Ji-Paraná', 22),
('Ariquemes', 22),

-- Roraima
('Boa Vista', 23),
('Rorainópolis', 23),
('Caracaraí', 23),

-- Santa Catarina
('Florianópolis', 24),
('Joinville', 24),
('Blumenau', 24),

-- São Paulo
('São Paulo', 25),
('Campinas', 25),
('Guarulhos', 25),

-- Sergipe
('Aracaju', 26),
('Nossa Senhora do Socorro', 26),
('Lagarto', 26),

-- Tocantins
('Palmas', 27),
('Araguaína', 27),
('Paraíso do Tocantins', 27);

-- Inserindo estados civis
INSERT INTO estado_civil (nome_estado_civil) VALUES
('Solteiro'),
('Casado'),
('Divorciado'),
('Viúvo'),
('União estável');

-- Inserindo gêneros
INSERT INTO genero (nome_genero) VALUES
('Masculino'),
('Feminino'),
('Não-binário'),
('Transgênero'),
('Gênero fluido');

-- Inserindo raças
INSERT INTO raca (nome_raca) VALUES
('Branca'),
('Preta'),
('Parda'),
('Amarela'),
('Indígena');

-- Inserindo religiões
INSERT INTO religiao (nome_religiao) VALUES
('Católica'),
('Evangélica'),
('Espírita'),
('Umbanda'),
('Sem religião');

-- Inserindo agências com nomes de bancos fictícios
INSERT INTO agencia (nome_agencia, num_agencia, id_cidade_agenciafk) VALUES
('Banco do Brasil Rio Branco', '001', 1),    -- Rio Branco, Acre
('Itaú Maceió', '002', 16),                  -- Maceió, Alagoas
('Bradesco Macapá', '003', 7),               -- Macapá, Amapá
('Santander Manaus', '004', 8),              -- Manaus, Amazonas
('Caixa Econômica Salvador', '005', 13),     -- Salvador, Bahia
('HSBC Fortaleza', '006', 14),                -- Fortaleza, Ceará
('Banrisul Brasília', '007', 15),             -- Brasília, Distrito Federal
('Banco Safra Vitória', '008', 24),           -- Vitória, Espírito Santo
('Banco Original Goiânia', '009', 18),       -- Goiânia, Goiás
('Banco Nacional São Luís', '010', 11);       -- São Luís, Maranhão

-- Inserindo endereços
INSERT INTO endereco (id_cidadefk, bairro, rua, num_casa) VALUES
(1, 'Centro', 'Rua A', '100'),    -- Rio Branco, Acre
(16, 'Jardim São Paulo', 'Rua B', '200'),  -- Maceió, Alagoas
(7, 'Avenida das Flores', 'Rua C', '300'),  -- Macapá, Amapá
(8, 'Bairro da Paz', 'Rua D', '400'),       -- Manaus, Amazonas
(13, 'Pelourinho', 'Rua E', '500');          -- Salvador, Bahia

-- Inserindo clientes
INSERT INTO cliente (nome, cpf, rg, data_nasc, fone, enderecofk, generofk, racafk, religiaofk, estado_civilfk, agenciafk, saldo) VALUES
('João Silva', '123.456.789-00', 'MG-12.345.678', '1985-06-15', '(31) 98765-4321', 1, 1, 1, 1, 1, '001', 1000.00),
('Maria Oliveira', '234.567.890-01', 'SP-23.456.789', '1990-04-20', '(11) 91234-5678', 2, 2, 2, 2, 2, '002', 1500.50),
('Carlos Pereira', '345.678.901-02', 'RJ-34.567.890', '1982-12-05', '(21) 99876-5432', 3, 1, 3, 3, 3, '003', 2000.75);

delimiter $$
create trigger saque_verif 
before insert on saque
for each row
begin
    declare saldo_atual float;

    select saldo into saldo_atual 
    from cliente 
    where id_cliente = new.conta;

    if saldo_atual < new.saque then
        signal sqlstate '45000'
        set message_text = 'Saldo insuficiente para saque';
    end if;
end$$
delimiter ;

delimiter $$
create trigger saque_att_deposito 
after insert on saque
for each row
begin
    update cliente 
    set saldo = saldo - new.saque
    where id_cliente = new.conta; 
end$$
delimiter ;

delimiter $$
create trigger deposito_att_saldo 
after insert on deposito
for each row
begin
    update cliente 
    set saldo = saldo + new.deposito 
    where id_cliente = new.conta; 
end$$
delimiter ;

select nome, saldo from cliente where id_cliente = 1;

-- Depósito de R$500
insert into deposito (conta, deposito) values (1, 500.00);

-- Saque de R$300
insert into saque (conta, saque) values (1, 300.00);

-- Saldo insuficiente
insert into saque (conta, saque) values (1, 1500.00);
