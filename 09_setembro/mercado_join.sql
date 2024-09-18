create database fornecedores; 

use fornecedores; 

  

create table cidade ( 

cod_cidade int auto_increment primary key, 

    nome varchar(100) not null 

); 

  

create table fornecedora ( 

cod_forne varchar(10) primary key not null, 

    nome varchar(255) not null, 

    cidade_sede int not null, foreign key (cidade_sede) references cidade (cod_cidade), 

grupo_cod_fornecedor varchar(50) 

); 

  

create table material ( 

cod_material int primary key not null, 

    cod_fornecedor varchar(10), foreign key (cod_fornecedor) references fornecedora (cod_forne), 

    nome varchar(255) not null, 

    descricao varchar(255) not null 

); 

  

-- Cidades 

insert into cidade values  

(null, 'Vitória'), 

(null, 'Rio de Janeiro'), 

(null, 'São Paulo'); 

  

-- Fornecedoras 

insert into fornecedora values  

('ABC', 'ABC Materiais Elétricos', 1, null), 

('XYZ', 'XYZ Materiais de Escritório', 2, 'HiX'), 

('Hidra', 'Hidra Materiais Hidráulicos', 3, 'HiX'), 

('HiX', 'HidraX Materiais Elétricos e Hidráulicos', 3, null); 

  

-- Materiais 

insert into material values  

(123, 'ABC', 'Tomada eletrica 10A Nova', 'Tomada eletrica 10A padrao novo'), 

(234, 'ABC', 'Disjuntor 25A', 'Disjuntor eletrico 25A'), 

(345, 'XYZ', 'Resma Papel A4', 'Resma papel branco A4'), 

(456, 'XYZ', 'Toner Imp HR5522', 'Toner impressora HR5522'), 

(678, 'Hidra', 'Cano PVC 1/2', 'Cano PVC 1/2 pol'), 

(679, 'Hidra', 'Cano PVC 3/4', 'Cano PVC 3/4 pol'), 

(680, 'Hidra', 'Medidor hidr 1/2', 'Medidor hidraulico 1/2 pol'), 

(681, 'Hidra', 'Joelho 1/2', 'Conector Joelho 1/2 pol'), 

(682, 'Hidra', 'Junta 1/2', 'Cano PVC 1/2 pol'), 

(1234, 'ABC', 'Tomada eletrica 20A Nova', 'Tomada eletrica 20A padrao novo'), 

(2345, 'XYZ', 'Caneta Azul', 'Caneta esferografica azul'), 

(4567, 'XYZ', 'Grapeador', 'Grampeador mesa pequeno'), 

(4568, 'XYZ', 'Caneta Marca Texto Amarela', 'Caneta Marca Texto Amarela'), 

(4569, 'XYZ', 'Lapis HB', 'Lapis Preto HB'); 

  

select fornecedora.nome, material.nome from fornecedora join material on material.cod_fornecedor = fornecedora.cod_forne where cod_forne = 'ABC'; 

select fornecedora.nome, material.nome from fornecedora join material on material.cod_fornecedor = fornecedora.cod_forne where cod_forne = 'XYZ'; 

select fornecedora.nome, material.nome from fornecedora join material on material.cod_fornecedor = fornecedora.cod_forne where cod_forne = 'HIDRA'; 