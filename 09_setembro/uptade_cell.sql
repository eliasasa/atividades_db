set sql_safe_updates = 0;

update cliente set telefone_cliente = insert (telefone_cliente, 3, 0, '9');

select id_estado,nome_estado from estado;

update cidade set id_estado = 2 where nome_cidade = 'Curitiba';

update cliente set email_cliente = replace (email_cliente, '@exemplo.com', '@teste.com') where id_cliente between 20 and 45