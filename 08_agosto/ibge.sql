select * from ms where municipio = 'Campo Grande';

select * from ms where vitima>3;

select * from ms where vitima = (select max(vitima) from ms);

select * from ms where vitima = (select min(vitima) from ms);

select count(*) from ms;

select avg(vitima) from ms;