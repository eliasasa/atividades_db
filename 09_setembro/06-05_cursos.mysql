/*5. No MySQL Workbench, utilizando o banco de dados ‘sprint’:
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
(tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
Inserir dados na tabela, procure inserir pelo menos 3 cursos.*/

create database if not exists 06_cursos;
use 06_cursos;

create table if not exists curso (
	idCurso int primary key auto_increment,
    nome varchar(50),
    sigla varchar(3),
    coordenador varchar(50)
);

insert into curso (nome, sigla, coordenador) values
('Ciência da Computação', 'CC', 'Patrícia Martins'),
('Engenharia Elétrica', 'EE', 'Ricardo Pereira'),
('Matemática', 'MAT', 'Ana Oliveira'),
('Administração', 'ADM', 'Carlos Souza'),
('Design Gráfico', 'DG', 'Fernanda Lima'),
('Física', 'FIS', 'João Santos');

-- a) Exibir todos os dados da tabela.
select * from curso;

-- b) Exibir apenas os coordenadores dos cursos.
select coordenador from curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
select * from curso where sigla = 'CC';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
select * from curso order by nome asc;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from curso order by coordenador desc;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from curso where sigla like 'A%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from curso where sigla like '%M';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from curso where nome like '_I%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
select * from curso where nome like '%C_';

-- j) Elimine a tabela.
drop table curso;
