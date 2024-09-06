create database atv_06_09;
use atv_06_09;

create table if not exists atleta (
	id_atleta int primary key,
    nome varchar(40), 
    modalidade varchar(40),
    qtdmedalha int
);

insert into atleta (id_atleta, nome, modalidade, qtdmedalha) values
(1, 'João Silva', 'Natação', 5),
(2, 'Maria Oliveira', 'Natação', 3),
(3, 'Carlos Souza', 'Atletismo', 4),
(4, 'Ana Costa', 'Atletismo', 2),
(5, 'Fernanda Lima', 'Ginástica', 6),
(6, 'Lucas Santos', 'Ginástica', 2),
(7, 'Pedro Almeida', 'Futebol', 8),
(8, 'Julia Martins', 'Futebol', 1),
(9, 'Roberto Pereira', 'Judô', 7),
(10, 'Camila Santos', 'Judô', 3);

-- Exibir todos os dados da tabela.
select * from atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;
update atleta set qtdmedalha = 3 where id_atleta = 1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3
update atleta set qtdmedalha = 7 where id_atleta = 2 or id_atleta = 3;

-- Atualizar o nome do atleta com o id=4;
update atleta set nome = 'Fabio Assunção' where id_atleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
alter table atleta add column dtNasc date;

-- Atualizar a data de nascimento de todos os atletas;
update atleta set dtnasc = '1998-04-14' where id_atleta = 1;
update atleta set dtnasc = '2007-05-07' where id_atleta = 2;
update atleta set dtnasc = '2006-01-16' where id_atleta = 3;
update atleta set dtnasc = '1880-04-01' where id_atleta = 4;
update atleta set dtnasc = '1990-03-24' where id_atleta = 5;
update atleta set dtnasc = '2014-11-13' where id_atleta = 6;
update atleta set dtnasc = '2000-12-25' where id_atleta = 7;
update atleta set dtnasc = '1953-10-02' where id_atleta = 8;
update atleta set dtnasc = '1967-02-19' where id_atleta = 9;
update atleta set dtnasc = '2021-07-24' where id_atleta = 10;

-- Excluir o atleta com o id=5;
delete from atleta where id_atleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação;
select nome, modalidade from atleta where modalidade != 'Natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
select * from atleta where qtdmedalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
alter table atleta modify modalidade varchar(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
describe atleta;
