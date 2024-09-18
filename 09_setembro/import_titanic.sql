CREATE DATABASE titanico; 

USE titanico; 

  

CREATE TABLE titanic_base( 

    id_passageiro INT PRIMARY KEY, 

    sobrevivente INT, 

    classe INT, 

    nome VARCHAR(100), 

    sexo VARCHAR(20), 

    idade varchar(20), 

    parentes INT, 

    filhos INT, 

    ticket VARCHAR(30), 

    tarifa float, 

    cabine VARCHAR(20), 

    embarcado VARCHAR(10) 

); 

  

  

select count(sobrevivente) from titanic_base where sobrevivente = 1; 

select count(idade) from titanic_base where idade < 12 and sobrevivente = 1 and idade != ''; 

select count(sexo) from titanic_base where sexo = 'Female' and sobrevivente = 1; 

select count(sexo) from titanic_base where sexo = 'male' and sobrevivente = 1; 