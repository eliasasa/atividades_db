/*4. No MySQL Workbench, utilizando o banco de dados ‘sprint’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela.
Exemplo do campo data: ‘AAAA-MM-DD’, ‘1983-10-13’.
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.*/
create database if not exists 06_professores;
use 06_professores;

create table if not exists professor (
	idProfessor int auto_increment primary key,
    nome varchar(50),
    especialidade varchar (40),
    dtNasc date
);

insert into professor (nome, especialidade, dtNasc) values
('Ana Oliveira', 'Professor', '1980-05-12'),
('Carlos Souza', 'Professor', '1975-11-23'),
('Fernanda Lima', 'Assistente', '1983-09-09'),
('João Santos', 'Assistente', '1978-02-19'),
('Mariana Costa', 'Coordenador', '1990-06-15'),
('Lucas Almeida', 'Coordenador', '1985-03-30'),
('Patrícia Martins', 'Diretor', '1972-07-22'),
('Ricardo Pereira', 'Diretor', '1968-11-05');

-- a) Exibir todos os dados da tabela.
select * from professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;
alter table professor add column funcao enum('monitor', 'assistente', 'titular');

-- c) Atualizar os professores inseridos e suas respectivas funções;
update professor set funcao = case 
    when especialidade = 'Professor' then 'monitor'
    when especialidade = 'Assistente' then 'assistente'
    when especialidade = 'Coordenador' then 'titular'
    when especialidade = 'Diretor' then 'titular'
end;

-- d) Inserir um novo professor;
insert into professor (nome, especialidade, dtNasc, funcao) values
('Juliana Almeida', 'Assistente', '1988-04-10', 'assistente');

-- e) Excluir o professor onde o idProfessor é igual a 5;
delete from professor where idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;
select nome, funcao, especialidade from professor where funcao = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
select especialidade, dtNasc from professor where funcao = 'monitor';

-- h) Atualizar a data de nascimento do idProfessor igual a 3;
update professor set dtNasc = '2000-01-16' where idProfessor = 3;

-- i) Limpar a tabela Professor;
truncate table professor;
