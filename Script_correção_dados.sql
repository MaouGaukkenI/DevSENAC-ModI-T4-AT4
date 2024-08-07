use teste;
-- Parte 1 inicio --
-- Primeir passo pra correção é remover a coluna telefone da tabela usuario:
ALTER TABLE cliente DROP COLUMN telefone;

-- Segundo passo é fazer a criação de uma nova tabela que vai armazenar os numeros de telefone com base no id do cliente:
CREATE TABLE telefone_cliente (
    id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    telefone VARCHAR(45) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);
-- Parte 1 Fim --

-- Parte 2 inicio --
-- Primeira parte é remover a coluna 'nome_produto' e 'valor_unitario':
ALTER TABLE item_venda
DROP COLUMN nome_produto;

ALTER TABLE item_venda
DROP COLUMN valor_unitario;

-- Segunda parte criamos uma nova tabela que contem as informações dos porudutos vendidos
CREATE TABLE item_venda_produto (
    id INT PRIMARY KEY,
    nome_produto VARCHAR(255),
    valor_unitario DECIMAL (9,2),
    produto_id INT,
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- terceira parte é criar uma coluna que contem o id da nova tabela criada para ter a relação dos produtos comprados e seus dados.
ALTER TABLE item_venda
ADD COLUMN item_venda_produto_id INT,
ADD FOREIGN KEY (item_venda_produto_id) REFERENCES item_venda_produto(id);
-- Parte 2 fim --

-- Parte 3 inicio --
-- Primeira parte, criamos uma nova tabela onde serão armazenados os dados referentes a pagamentos
CREATE TABLE pagamento(
  id INT NOT NULL AUTO_INCREMENT,
  venda_id INT NOT NULL,
  tipo_pagamento CHAR(1) NOT NULL,
  numero_cartao_pagamento VARCHAR(16) NULL,
  numero_parcelas_pagamento INT NULL,
  data_pagamento DATETIME NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (venda_id) REFERENCES venda (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Segunda parte, retiramos da tabela venda todos os dados referentes a pagamento pois ja passamos eles pra uma nova tabela
ALTER TABLE venda
DROP COLUMN tipo_pagamento,
DROP COLUMN numero_cartao_pagamento,
DROP COLUMN numero_parcelas_pagamento,
DROP COLUMN data_pagamento;

-- Terceiro passo, criamos uma tabela que relacione a veenda com o cliente
CREATE TABLE venda_cliente(
  venda_id INT NOT NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (venda_id),
  FOREIGN KEY (venda_id) REFERENCES venda (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (cliente_id) REFERENCES cliente (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Quarto passo, deletamos a foreingnKey que não é mais utel na tabela venda
ALTER TABLE venda
DROP FOREIGN KEY fk_cliente;

-- Quinto passo, removemos o id do usuario da venda, pois ele agora esta na nova tabela
ALTER TABLE venda
DROP COLUMN cliente_id;

-- Sexto passo, criamos um nova ForgeignKey com o mesmo principio da que apagamos anteriormente, so que na nova tabela
ALTER TABLE venda_cliente
ADD CONSTRAINT fk_cliente
FOREIGN KEY (cliente_id) REFERENCES cliente (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
-- Parte 3 Fim --
