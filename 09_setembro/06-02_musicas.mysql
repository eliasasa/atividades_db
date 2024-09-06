create database if not exists 06_musicas;
use 06_musicas;

create table if not exists musica (
	idMusica int auto_increment primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

/* 2. No MySQL Workbench, utilizando o banco de dados ‘sprint’:
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas. */

insert into musica (titulo, artista, genero) values
('Du Hast', 'Rammstein', 'Metal'),
('Sonne', 'Rammstein', 'Metal'),
('Enter Sandman', 'Metallica', 'Metal'),
('Nothing Else Matters', 'Metallica', 'Metal'),
('Smells Like Teen Spirit', 'Nirvana', 'Grunge'),
('Come As You Are', 'Nirvana', 'Grunge'),
('Hurt', 'Oliver Tree', 'Pop'),
('Bum Bum Tam Tam', 'MC Fioti', 'Funk'),
('Cheguei Pra Te Amar', 'Ludmilla', 'Funk');


-- a) Exibir todos os dados da tabela.
select * from musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;
alter table musica add column curtidas int;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
set sql_safe_updates = 0;
update musica set curtidas = case 
    when idMusica = 1 then 15
    when idMusica = 2 then 18
    when idMusica = 3 then 1500
    when idMusica = 4 then 12
    when idMusica = 5 then 1400
    when idMusica = 6 then 8
    when idMusica = 7 then 20
    when idMusica = 8 then 0
    when idMusica = 9 then 1
end;


-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
alter table musica modify artista varchar(40);

-- e) Atualizar a quantidade de curtidas da música com id=1;
update musica set curtidas = 1799 where idMusica = 1;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
update musica set curtidas = case 
    when idMusica = 2 then 1999
    when idMusica = 3 then 999
    else curtidas
end;

-- g) Atualizar o nome da música com o id=5;
update musica set titulo = 'Nirvana é ruim' where idMusica = 5;

-- h) Excluir a música com o id=4;
delete from musica where idMusica = 4;

-- i) Exibir as músicas onde o gênero é diferente de funk;
select titulo, genero from musica where genero !=  'Funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
select * from musica where curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
describe musica;

-- l) Limpar os dados da tabela; 
truncate table musica;
