/*6. No MySQL Workbench, utilizando o banco de dados ‘sprint’:
Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
Epoca, Quatro Rodas, Claudia, etc).
Escreva e execute os comandos para:
• Criar a tabela chamada Revista para conter os campos: idRevista (int e chave
primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os
valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente
pelo sistema.
• Inserir 4 registros na tabela, mas sem informar a categoria.
Escreva e execute os comandos para:*/

create database if not exists 06_revistas;
use 06_revistas;

create table if not exists revista (
	idRevista int auto_increment primary key,
    nome varchar(40),
    categoria varchar(30)
);

insert into revista (nome) values
('Time'),
('National Geographic'),
('Forbes'),
('The New Yorker'),
('Wired'),
('Vogue'),
('Scientific American'),
('Sports Illustrated');

-- • Exibir todos os dados da tabela.
select * from revista;

-- • Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update revista set categoria = case 
    when idRevista = 1 then 'Notícias'
    when idRevista = 2 then 'Ciência'
    when idRevista = 3 then 'Negócios'
end;
select * from revista;

-- • Insira mais 3 registros completos.
insert into revista (nome, categoria) values
('GQ', 'Moda'),
('Entrepreneur', 'Empreendedorismo'),
('Rolling Stone', 'Música');

-- • Exibir novamente os dados da tabela.
select * from revista;

-- • Exibir a descrição da estrutura da tabela.
describe revista;

-- • Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table revista modify categoria varchar(40);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
describe revista;

-- • Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table revista add column periodicidade varchar(15);

-- • Exibir os dados da tabela.
select * from revista;

-- • Excluir a coluna periodicidade da tabela.
alter table revista drop column periodicidade;
