CREATE DATABASE cadDB;
USE cadDB;

-- Criar tabela pecas
CREATE TABLE pecas (
    idpecas INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT not null,
    variante VARCHAR(255),
    ps VARCHAR(10),
    codigo VARCHAR(50),
    qtde_base DECIMAL(10, 2),
    qtde DECIMAL(10, 2),
    um VARCHAR(10),
    custo_unitario DECIMAL(10, 2),
    qtfixa_ou_variavel ENUM('fixa', 'variavel'),
    ordem INT,
    ci VARCHAR(50),
    origem VARCHAR(50),
    status ENUM('ativo', 'não ativo')
);


-- Inserir dados na tabela pecas
INSERT INTO pecas (
    descricao, variante, ps, codigo, qtde_base, qtde, um, custo_unitario, 
    qtfixa_ou_variavel, ordem, ci, origem, status
) VALUES 
('Peca A', 'Variante 1', 'P', 'COD123', 100.00, 50.00, 'un', 20.00, 
'fixa', 1, 'CI123', 'Origem A', 'ativo'),
('Peca B', 'Variante 2', 'S', 'COD456', 200.00, 150.00, 'kg', 10.00, 
'variavel', 2, 'CI456', 'Origem B', 'não ativo');

-- Criar tabela sexo
CREATE TABLE sexo (
    idsexo INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(30)
);

-- Inserir dados na tabela sexo
INSERT INTO sexo (tipo)
VALUES ('Masculino'),
       ('Feminino'),
       ('Não se aplica');

-- Criar tabela cadcli
CREATE TABLE cadcli (
    id_cadcli INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(70),
    telefone_comercial VARCHAR(20) UNIQUE,
    telefone_resid VARCHAR(20) UNIQUE,
    cpf CHAR(11) UNIQUE,
    quem_indicou VARCHAR(70)
);

-- Inserir dados na tabela cadcli
INSERT INTO cadcli (nome, telefone_comercial, telefone_resid, cpf, quem_indicou)
VALUES ('João da Silva', '(11) 1234-5678', '(11) 9876-5432', '12345678901', 'Maria Oliveira');

-- Criar tabela notafiscal
CREATE TABLE notafiscal (
    idnotafiscal INT AUTO_INCREMENT PRIMARY KEY,
    sequencia INT NOT NULL,
    emissao DATE NOT NULL,
    vencimento DATE NOT NULL,
    previsao_faturamento DATE,
    aprovacao_cliente BOOLEAN,
    hora_aprovacao TIME,
    embarques INT,
    prazo_entrega INT, -- Prazo de entrega em dias
    n_pedido_compras VARCHAR(50),
    vendedor VARCHAR(100),
    historico TEXT,
    faturamento DECIMAL(10, 2),
    docto VARCHAR(50),
    id_cadcli INT,
    idpecas INT,
    FOREIGN KEY (id_cadcli) REFERENCES cadcli(id_cadcli),
    FOREIGN KEY (idpecas) REFERENCES pecas(idpecas)
);

-- Inserir dados na tabela notafiscal
INSERT INTO notafiscal (
    sequencia, emissao, vencimento, previsao_faturamento, aprovacao_cliente, 
    hora_aprovacao, embarques, prazo_entrega, n_pedido_compras, vendedor, 
    historico, faturamento, docto, id_cadcli, idpecas
) VALUES (
    1, '2024-09-01', '2024-09-30', '2024-09-15', TRUE, 
    '14:30:00', 1, 15, 'PED123456', 'Carlos Santos', 
    'Nota fiscal referente à compra de materiais', 1500.00, 
    'NF123456789', 1, 1
);

CREATE TABLE servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) NOT NULL,
    data_emissao DATE NOT NULL,
    id_cliente INT,
    previsao_data DATE,
    descricao TEXT,
    execucao TEXT,
    nome_peca VARCHAR(255) not null,
    variante_peca VARCHAR(255),
    quantidade DECIMAL(10, 2) not null,
    valor DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES cadcli(id_cadcli)
);

-- Inserir um novo serviço
INSERT INTO servicos (
    documento, data_emissao, id_cliente, previsao_data, descricao, execucao, 
    nome_peca, variante_peca, quantidade, valor
) VALUES (
    '0000000123-2', '2024-09-15', 1, '2024-10-01', 
    'Serviço de manutenção preventiva', 'Manutenção executada com sucesso', 
    'Peca A', 'Variante 1', 5, 1000.00
);

/* 
-- Selecionar todos os serviços
SELECT * FROM servicos;

-- Selecionar um serviço específico pelo número do documento
SELECT * FROM servicos
WHERE documento = '0000000123-2';

-- Deletar um serviço específico pelo número do documento
DELETE FROM servicos
WHERE documento = '0000000123-2';

-- Atualizar informações de um serviço específico
UPDATE servicos
SET 
    data_emissao = '2024-09-20', 
    previsao_data = '2024-10-05', 
    descricao = 'Serviço de manutenção preventiva revisado', 
    execucao = 'Manutenção realizada com alguns ajustes', 
    nome_peca = 'Peca B', 
    variante_peca = 'Variante 2', 
    quantidade = 6, 
    valor = 1200.00
WHERE documento = '0000000123-2';


*/

-- Criar tabela cadcligeral
CREATE TABLE cadcligeral (
    id_cadcligeral INT AUTO_INCREMENT PRIMARY KEY,
    id_cadcli INT,
    aliquota FLOAT,
    tabela_preco FLOAT,
    transportadora1 VARCHAR(40),
    transportadora2 VARCHAR(40),
    regime_de_tributacao ENUM('pj', 'pf'),
    nome VARCHAR(70),
    situacao_do_icms INT,
    insc_estadual VARCHAR(14),
    email VARCHAR(50),
    email_danfe VARCHAR(50),
    email_de_cobranca VARCHAR(50),
    email_loja_virual VARCHAR(50),
    telefone_comercial VARCHAR(20),
    ramal VARCHAR(20),
    tel_celular VARCHAR(20) UNIQUE,
    fax VARCHAR(20),
    cpf CHAR(11) UNIQUE,
    insc_suframa VARCHAR(20) UNIQUE,
    data_nascm DATE,
    mod_frete VARCHAR(20),
    st_de_cadastro VARCHAR(50),
    rg VARCHAR(15) UNIQUE,
    linha_do_perfil TEXT,
    rua VARCHAR(50),
    cep VARCHAR(10),
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    numero INT,
    dataNasc DATE,
    titulo_eleitoral VARCHAR(12) NOT NULL,
    nivel_de_acesso INT,
    rede_social VARCHAR(50),
    telefone VARCHAR(20),
    idsexo INT,
    tipo_contato VARCHAR(50),
    valor VARCHAR(100),
    descricao TEXT,
    tipo_transacao VARCHAR(50),
    comissao DECIMAL(10, 2),
    raca VARCHAR(30),
    categoria VARCHAR(50),
    datacontracao DATE,
    salario DECIMAL(10, 2),
    data_contracao DATE,
    data_transicao DATE,
    limite_credito DECIMAL(10, 2),
    cnpj VARCHAR(20) UNIQUE,
    comida_favorita VARCHAR(100),
    foto_perfil VARCHAR(100),
    gosto_musical VARCHAR(100),
    cor_favorita VARCHAR(100),
    idnotafiscal INT,
    FOREIGN KEY (idnotafiscal) REFERENCES notafiscal(idnotafiscal),
    FOREIGN KEY (idsexo) REFERENCES sexo(idsexo),
    FOREIGN KEY (id_cadcli) REFERENCES cadcli(id_cadcli)
);

-- Inserir dados na tabela cadcligeral
INSERT INTO cadcligeral (
    id_cadcli, aliquota, tabela_preco, transportadora1, transportadora2, 
    regime_de_tributacao, nome, situacao_do_icms, insc_estadual, email, 
    email_danfe, email_de_cobranca, email_loja_virual, telefone_comercial, 
    ramal, tel_celular, fax, cpf, insc_suframa, data_nascm, mod_frete, 
    st_de_cadastro, rg, linha_do_perfil, rua, cep, bairro, cidade, 
    numero, dataNasc, titulo_eleitoral, nivel_de_acesso, rede_social, telefone, 
    idsexo, tipo_contato, valor, descricao, 
    tipo_transacao, comissao, raca, categoria, datacontracao, salario, 
    data_contracao, data_transicao, limite_credito, cnpj, comida_favorita, 
    foto_perfil, gosto_musical, cor_favorita, idnotafiscal
) VALUES (
    1, 18.00, 100.00, 'Transportadora XYZ', 'Transportadora ABC', 
    'pj', 'João da Silva', 1, '12345678901234', 'joao.silva@example.com', 
    'danfe@exemplo.com', 'cobranca@exemplo.com', 'loja@exemplo.com', '(11) 1234-5678', 
    '123', '(11) 91234-5678', '(11) 8765-4321', '12345678901', '123456789012345', 
    '1980-01-01', 'CIF', 'Ativo', 'MG123456', 'Perfil completo', 'Rua Exemplo', 
    '01234-567', 'Bairro Exemplo', 'Cidade Exemplo', 123, '1980-01-01', 
    '123456789012', 2, 'facebook.com/joaosilva', '(11) 1234-5678', 1, 
    'Comercial', '1000', 'Descrição do cliente', 'Venda', 0.05, 'Branca', 'VIP', 
    '2024-01-01', 3000.00, '2024-01-01', '2024-12-31', 10000.00, '12.345.678/0001-99', 
    'Pizza', 'foto.jpg', 'Rock', 'Azul', 1
);

/*UPDATE cadcligeral
SET 
    aliquota = 22.5,                                 
    tabela_preco = 150.00,                           
    transportadora1 = 'Transportadora Alpha',        
    transportadora2 = 'Transportadora Beta',         
    regime_de_tributacao = 'pj',                     
    nome = 'Carlos Alberto',                         
    situacao_do_icms = 2,                           
    insc_estadual = '12345678901234',                
    email = 'carlos.alberto@example.com',            
    email_danfe = 'danfe@example.com',               
    email_de_cobranca = 'cobranca@example.com',      
    email_loja_virual = 'loja.virtual@example.com',  
    telefone_comercial = '(11) 91234-5678',          
    ramal = '123',                                   
    tel_celular = '(11) 98765-4321',                 
    fax = '(11) 8765-4321',                          
    cpf = '12345678901',                            
    insc_suframa = '123456789012345',                
    data_nascm = '1980-01-01',                       
    rg = 'MG1234567',                                
    linha_do_perfil = 'Novo perfil atualizado',     
    rua = 'Rua Nova',                                
    cidade = 'Nova Cidade',                          
    numero = 456,                                    
    dataNasc = '1980-01-01',                         
    titulo_eleitoral = '987654321012',               
    nivel_de_acesso = 5,                             
    rede_social = 'facebook.com/carlos',             
    telefone = '(11) 91234-5678',                    
    idsexo = 1,                                      
    tipo_contato = 'Pessoal',                        
    valor = '1500',                                  
    descricao = 'Descrição atualizada do cliente',   
    tipo_transacao = 'Compra',                       
    comissao = 0.10,                                 
    categoria = 'Premium',                           
    datacontracao = '2023-01-01',                    
    salario = 5000.00,                               
    data_contracao = '2023-01-01',                   
    data_transicao = '2023-12-31',                   
    limite_credito = 15000.00,                       
    cnpj = '12.345.678/0001-00',                     
    comida_favorita = 'Sushi',                       
    foto_perfil = 'foto_nova.jpg',                   
    gosto_musical = 'Jazz',                          
    cor_favorita = 'Verde',                          
    idnotafiscal = 1                                 
WHERE 
    id_cadcligeral = 1;*/

/*SELECT * FROM notafiscal;
SELECT * FROM pecas;
SELECT * FROM sexo;
SELECT * FROM cadcli;
SELECT * FROM cadcligeral;
UPDATE sexo SET tipo = 'Não-binário' WHERE idsexo = 3

DELETE FROM pecas;
DELETE FROM sexo;
DELETE FROM cadcli;*/




