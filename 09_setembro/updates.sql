create database if not exists atvclientes; 

use atvclientes; 

  

create table if not exists escolaridade ( 

id_escolaridade int primary key auto_increment, 

    escolaridade varchar(50) not null 

); 

  

create table if not exists raca ( 

id_raca int primary key auto_increment, 

    raca varchar(30) not null 

); 

  

create table if not exists nacionalidade ( 

id_nacionalidade int primary key auto_increment, 

    nacionalidade varchar(30) not null 

); 

  

create table if not exists sexo ( 

id_sexo int primary key auto_increment, 

    sexo varchar(30) not null 

); 

  

create table if not exists estado ( 

id_estado int auto_increment primary key, 

    estado varchar(20) not null 

); 

  

create table if not exists cidade( 

id_cidade int primary key auto_increment, 

    cidade varchar(50) not null, 

    fkid_estado int not null, foreign key (fkid_estado) references estado(id_estado) 

); 

  

create table if not exists estado_civil ( 

id_estado_civil int primary key auto_increment, 

    estado_civil varchar(20) not null 

); 

  

create table if not exists clientes( 

cpf varchar(11) unique not null, 

nome varchar(100) not null, 

rg varchar(9) unique not null, 

fkid_cidade int not null, foreign key (fkid_cidade) references cidade(id_cidade), 

fkid_sexo int not null, foreign key (fkid_sexo) references sexo(id_sexo), 

fkid_nacionalidade int not null, foreign key (fkid_nacionalidade) references nacionalidade(id_nacionalidade), 

fone varchar(20) unique, 

fkid_raca int not null, foreign key (fkid_raca) references raca(id_raca), 

fkid_escolaridade int not null, foreign key (fkid_escolaridade) references escolaridade(id_escolaridade), 

    fkid_estado_civil int not null, foreign key (fkid_estado_civil) references estado_civil(id_estado_civil) 

); 

  

-- Estados civis 

  

insert into estado_civil values 

(null, 'Solteiro'), 

(null, 'Casado'), 

(null, 'Viúvo'), 

(null, 'Divorciado'); 

  

-- Estados do Brasil 

  

insert ignore into estado (estado) values  

('AC'), 

('AL'), 

('AP'), 

('AM'), 

('BA'), 

('CE'), 

('DF'), 

('ES'), 

('GO'), 

('MA'), 

('MT'), 

('MS'), 

('MG'), 

('PA'), 

('PB'), 

('PR'), 

('PE'), 

('PI'), 

('RJ'), 

('RN'), 

('RS'), 

('RO'), 

('RR'), 

('SC'), 

('SP'), 

('SE'), 

('TO'); 

  

insert ignore into cidade (cidade, fkid_estado) values 

-- Acre (AC) 

('Rio Branco', 1), 

('Cruzeiro do Sul', 1), 

('Sena Madureira', 1), 

('Tarauacá', 1), 

('Feijó', 1), 

  

-- Alagoas (AL) 

('Maceió', 2), 

('Arapiraca', 2), 

('Palmeira dos Índios', 2), 

('São Miguel dos Campos', 2), 

('Delmiro Gouveia', 2), 

  

-- Amapá (AP) 

('Macapá', 3), 

('Santana', 3), 

('Laranjal do Jari', 3), 

('Oiapoque', 3), 

('Mazagão', 3), 

  

-- Amazonas (AM) 

('Manaus', 4), 

('Parintins', 4), 

('Itacoatiara', 4), 

('Coari', 4), 

('Tefé', 4), 

  

-- Bahia (BA) 

('Salvador', 5), 

('Feira de Santana', 5), 

('Vitória da Conquista', 5), 

('Ilhéus', 5), 

('Juazeiro', 5), 

  

-- Ceará (CE) 

('Fortaleza', 6), 

('Caucaia', 6), 

('Juazeiro do Norte', 6), 

('Sobral', 6), 

('Crato', 6), 

  

-- Distrito Federal (DF) 

('Brasília', 7), 

('Taguatinga', 7), 

('Ceilândia', 7), 

('Samambaia', 7), 

('Planaltina', 7), 

  

-- Espírito Santo (ES) 

('Vitória', 8), 

('Vila Velha', 8), 

('Serra', 8), 

('Cachoeiro de Itapemirim', 8), 

('Colatina', 8), 

  

-- Goiás (GO) 

('Goiânia', 9), 

('Anápolis', 9), 

('Aparecida de Goiânia', 9), 

('Rio Verde', 9), 

('Catalão', 9), 

  

-- Maranhão (MA) 

('São Luís', 10), 

('Imperatriz', 10), 

('Caxias', 10), 

('Timon', 10), 

('Bacabal', 10), 

  

-- Mato Grosso (MT) 

('Cuiabá', 11), 

('Várzea Grande', 11), 

('Rondonópolis', 11), 

('Sinop', 11), 

('Tangará da Serra', 11), 

  

-- Mato Grosso do Sul (MS) 

('Campo Grande', 12), 

('Dourados', 12), 

('Três Lagoas', 12), 

('Corumbá', 12), 

('Ponta Porã', 12), 

  

-- Minas Gerais (MG) 

('Belo Horizonte', 13), 

('Uberlândia', 13), 

('Contagem', 13), 

('Juiz de Fora', 13), 

('Montes Claros', 13), 

  

-- Pará (PA) 

('Belém', 14), 

('Ananindeua', 14), 

('Santarém', 14), 

('Marabá', 14), 

('Parauapebas', 14), 

  

-- Paraíba (PB) 

('João Pessoa', 15), 

('Campina Grande', 15), 

('Patos', 15), 

('Bayeux', 15), 

('Santa Rita', 15), 

  

-- Paraná (PR) 

('Curitiba', 16), 

('Londrina', 16), 

('Maringá', 16), 

('Ponta Grossa', 16), 

('Cascavel', 16), 

  

-- Pernambuco (PE) 

('Recife', 17), 

('Olinda', 17), 

('Caruaru', 17), 

('Jaboatão dos Guararapes', 17), 

('Petrolina', 17), 

  

-- Piauí (PI) 

('Teresina', 18), 

('Parnaíba', 18), 

('Floriano', 18), 

('Picos', 18), 

('Oeiras', 18), 

  

-- Rio de Janeiro (RJ) 

('Rio de Janeiro', 19), 

('Niterói', 19), 

('Duque de Caxias', 19), 

('Nova Iguaçu', 19), 

('Campos dos Goytacazes', 19), 

  

-- Rio Grande do Norte (RN) 

('Natal', 20), 

('Mossoró', 20), 

('Parnamirim', 20), 

('Caicó', 20), 

('São Gonçalo do Amarante', 20), 

  

-- Rio Grande do Sul (RS) 

('Porto Alegre', 21), 

('Caxias do Sul', 21), 

('Pelotas', 21), 

('Santa Maria', 21), 

('Gravataí', 21), 

  

-- Rondônia (RO) 

('Porto Velho', 22), 

('Ji-Paraná', 22), 

('Ariquemes', 22), 

('Vilhena', 22), 

('Rolim de Moura', 22), 

  

-- Roraima (RR) 

('Boa Vista', 23), 

('Rorainópolis', 23), 

('Caracaraí', 23), 

('Mucajaí', 23), 

('Normandia', 23), 

  

-- Santa Catarina (SC) 

('Florianópolis', 24), 

('Joinville', 24), 

('Blumenau', 24), 

('Chapecó', 24), 

('Itajaí', 24), 

  

-- São Paulo (SP) 

('São Paulo', 25), 

('Campinas', 25), 

('São Bernardo do Campo', 25), 

('Santos', 25), 

('Sorocaba', 25), 

  

-- Sergipe (SE) 

('Aracaju', 26), 

('Nossa Senhora do Socorro', 26), 

('Lagarto', 26), 

('Itabaiana', 26), 

('Estância', 26), 

  

-- Tocantins (TO) 

('Palmas', 27), 

('Araguaína', 27), 

('Gurupi', 27), 

('Porto Nacional', 27), 

('Colinas do Tocantins', 27); 

  

-- Sexo 

  

insert ignore into sexo (sexo) values 

('masculino'), 

('feminino'), 

('outro'); 

  

-- Nacionalidade 

  

insert ignore into nacionalidade (nacionalidade) values 

('brasileira'), 

('estrangeira'); 

  

insert ignore into raca (raca) values 

('branca'), 

('negra'), 

('parda'), 

('amarela'), 

('indígena'); 

  

insert ignore into escolaridade (escolaridade) values 

('Ensino Fundamental Incompleto'), 

('Ensino Fundamental Completo'), 

('Ensino Médio Incompleto'), 

('Ensino Médio Completo'), 

('Educação Técnica'), 

('Superior Incompleto'), 

('Superior Completo'), 

('Pós-Graduação'); 

  

-- Inserção de Clientes 

  

INSERT IGNORE INTO clientes (cpf, nome, rg, fkid_cidade, fkid_sexo, fkid_nacionalidade, fone, fkid_raca, fkid_escolaridade, fkid_estado_civil) VALUES 

('12345678901', 'Ana Silva', '123456789', 1, 2, 2, '11987654321', 1, 7, 1), 

('23456789012', 'Carlos Oliveira', '234567790', 2, 1, 1, '21988765432', 1, 6, 2),  

('34567890123', 'Fernanda Santos', '345678791', 3, 2, 2, '31999991112', 2, 8, 3), 

('45678901234', 'Pedro Almeida', '456789012', 4, 1, 1, '41912345679', 3, 5, 4),  

('56789012345', 'Juliana Costa', '567890123', 5, 2, 1, '51923456780', 2, 4, 2), 

('67890123456', 'Roberto Lima', '678901234', 6, 1, 2, '61934567891', 1, 6, 1), 

('78901234567', 'Mariana Sousa', '789012345', 7, 2, 2, '71945678902', 4, 7, 3), 

('89012345678', 'Ricardo Martins', '890123456', 8, 1, 2, '81956789013', 5, 3, 4),  

('90123456789', 'Isabela Pereira', '901234567', 9, 2, 1, '91967890124', 3, 8, 2),  

('01234567890', 'Thiago Rocha', '012345678', 10, 1, 1, '11978901235', 1, 5, 3),  

('12345098765', 'Camila Fernandes', '123450987', 11, 2, 1, '21989012346', 2, 6, 4), 

('23456109876', 'Lucas Moreira', '234561098', 12, 1, 1, '31990123457', 4, 7, 1), 

('34567210987', 'Tatiane Gomes', '345672109', 13, 2, 1, '41991234568', 1, 8, 2), 

('45678321098', 'André Silva', '456783210', 14, 1, 1, '51992345679', 3, 6, 3), 

('56789432109', 'Larissa Lima', '567894321', 15, 2, 1, '61993456780', 5, 4, 4), 

('67890543210', 'Bruno Alves', '678905432', 16, 1, 1, '71994567891', 2, 5, 1), 

('78901654321', 'Patrícia Duarte', '789016543', 17, 2, 1, '81995678902', 1, 8, 2), 

('89012765432', 'Eduardo Ferreira', '890127654', 18, 1, 1, '91996789013', 4, 7, 3), 

('90123876543', 'Aline Barbosa', '901238765', 19, 2, 1, '11997890124', 2, 6, 4), 

('01234987654', 'João Vitor', '012349876', 20, 1, 1, '21998901235', 3, 5, 1), 

('12345678910', 'Gabriela Santos', '123456789', 21, 2, 1, '31999012346', 5, 8, 2);  

  

-- ---------------------------------------------- UPDATES 04/09 ---------------------------------------------- 

SET SQL_SAFE_UPDATES = 0; 

  

update cidade set cidade = CASE when cidade < 'M%' then 'Abaixo de M' else 'Acima de M' end; 

  

update estado set estado = case when estado in ('AC', 'AM', 'AP', 'PA', 'RO', 'RR', 'TO') THEN 'Norte' 

when estado in ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE') THEN 'Nordeste' 

when estado in ('DF', 'GO', 'MT', 'MS') then 'Centro Oeste' 

when estado in ('ES', 'MG', 'RJ', 'SP') then 'Sudeste' 

when estado in ('PR', 'RS', 'SC') then 'Sul' end; 

  

update nacionalidade set nacionalidade = 'Fora do Brasil' where nacionalidade = 'estrangeira'; 

update raca set raca = 'seres humanos'; 

update escolaridade set escolaridade  = case when escolaridade like 'Ensino Fundamental%' or escolaridade like 'Ensino Médio%' then 'Ensino básico' else 'Ensino avançado' end; 

  

-- Nome e cidade 

SELECT clientes.nome, cidade.cidade FROM clientes JOIN cidade ON clientes.fkid_cidade = cidade.id_cidade; 

  

-- Nome e estado 

SELECT clientes.nome, estado.estado FROM clientes JOIN cidade ON clientes.fkid_cidade = cidade.id_cidade JOIN estado ON cidade.fkid_estado = estado.id_estado; 

  

-- Nome, CPF e raça 

SELECT clientes.nome, clientes.cpf, raca.raca FROM clientes JOIN raca ON clientes.fkid_raca = raca.id_raca; 

  

-- Nome e nacionalidade 

SELECT clientes.nome, nacionalidade.nacionalidade FROM clientes JOIN nacionalidade ON clientes.fkid_nacionalidade = nacionalidade.id_nacionalidade; 

  

-- Nome e escolaridade 

SELECT clientes.nome, escolaridade.escolaridade FROM clientes JOIN escolaridade ON clientes.fkid_escolaridade = escolaridade.id_escolaridade; 

  

-- Nome, cidade e estado 

SELECT clientes.nome, cidade.cidade, estado.estado FROM clientes JOIN cidade ON clientes.fkid_cidade = cidade.id_cidade JOIN estado ON cidade.fkid_estado = estado.id_estado; 

  

-- Nome, cidade, estado, telefone, RG, sexo, nacionalidade, raça e escolaridade: 

SELECT clientes.nome, cidade.cidade, estado.estado, clientes.fone, clientes.rg, sexo.sexo, nacionalidade.nacionalidade, raca.raca, escolaridade.escolaridade, estado_civil.estado_civil 

FROM clientes  

JOIN cidade ON clientes.fkid_cidade = cidade.id_cidade  

JOIN estado ON cidade.fkid_estado = estado.id_estado  

JOIN sexo ON clientes.fkid_sexo = sexo.id_sexo  

JOIN nacionalidade ON clientes.fkid_nacionalidade = nacionalidade.id_nacionalidade  

JOIN raca ON clientes.fkid_raca = raca.id_raca  

JOIN escolaridade ON clientes.fkid_escolaridade = escolaridade.id_escolaridade 

JOIN estado_civil ON clientes.fkid_estado_civil = estado_civil.id_estado_civil 

; 

 