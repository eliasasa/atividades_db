/*3. No MySQL Workbench, utilizando o banco de dados ‘sprint’:
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.*/

create database if not exists 06_filmes;
use 06_filmes;

create table if not exists Filme (
	idFilme int auto_increment primary key,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40)
);

insert into Filme (titulo, genero, diretor) values
('Inception', 'Sci-Fi', 'Christopher Nolan'),
('Interstellar', 'Sci-Fi', 'Christopher Nolan'),
('The Dark Knight', 'Action', 'Christopher Nolan'),
('The Matrix', 'Sci-Fi', 'The Wachowskis'),
('John Wick', 'Action', 'Chad Stahelski'),
('The Avengers', 'Action', 'Joss Whedon'),
('The Departed', 'Crime', 'Martin Scorsese'),
('The Shawshank Redemption', 'Drama', 'Frank Darabont'),
('Forrest Gump', 'Drama', 'Robert Zemeckis'),
('Se7en', 'Suspense', 'David Fincher'),
('Gone Girl', 'Suspense', 'David Fincher');

-- Exibir todos os dados da tabela.
select * from Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
alter table Filme add column protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
update Filme set protagonista = case 
    when idFilme = 1 then 'Leonardo DiCaprio'
    when idFilme = 2 then 'Matthew McConaughey'
    when idFilme = 3 then 'Christian Bale'
    when idFilme = 4 then 'Keanu Reeves'
    when idFilme = 5 then 'Keanu Reeves'
    when idFilme = 6 then 'Robert Downey Jr.'
    when idFilme = 7 then 'Leonardo DiCaprio'
    when idFilme = 8 then 'Tim Robbins'
    when idFilme = 9 then 'Tom Hanks'
    when idFilme = 10 then 'Brad Pitt'
    when idFilme = 11 then 'Ben Affleck'
end;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
alter table Filme modify diretor varchar(150);

-- Atualizar o diretor do filme com id=5;
update Filme set diretor = 'Otavio Mesquita' where idFilme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update Filme set diretor = case 
    when idFilme = 2 then 'Michael Jackson'
    when idFilme = 7 then 'Daftones da Silva'
    else idFilme
end;

-- Atualizar o título do filme com o id=6;
update filme set titulo = 'Fuga das Galinhas 3' where idFilme=6;

-- Excluir o filme com o id=3;
delete from filme where idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama;
select titulo, genero from filme where genero != 'Drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
select titulo, genero from filme where genero != 'Suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
describe filme;

-- Limpar os dados da tabela;
truncate table filme;
