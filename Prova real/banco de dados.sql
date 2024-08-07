use teste;

CREATE TABLE usuario(
  `id` INT NOT NULL,
  `login` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  `ultimo_login` DATETIME NULL,
  PRIMARY KEY (`id`));

CREATE TABLE cargo(
  `id` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `salario` DECIMAL(9,2) NULL,
  `comissao` FLOAT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE funcionario(
  `nome` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NULL,
  `id` INT NOT NULL,
  `usuario_id` INT NULL,
  `cargo_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_cargo_idx` (`cargo_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `TESTE`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cargo`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `TESTE`.`cargo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE cliente(
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `endereco` VARCHAR(255) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE venda(
  `id` INT NOT NULL,
  `data` DATETIME NULL,
  `data_envio` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `valor_total` DECIMAL(9,2) NULL,
  `cliente_id` INT NOT NULL,
  `funcionario_id` INT NOT NULL,
  `tipo_pagamento` CHAR(1) NOT NULL,
  `numero_cartao_pagamento` VARCHAR(16) NULL,
  `numero_parcelas_pagamento` INT NULL,
  `data_pagamento` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_funcionario_idx` (`funcionario_id` ASC) VISIBLE,
  INDEX `fk_cliente_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_funcionario`
    FOREIGN KEY (`funcionario_id`)
    REFERENCES `TESTE`.`funcionario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `TESTE`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE produto(
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NULL,
  `estoque` INT NULL,
  `fabricante` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE item_venda(
  `quantidade` INT NOT NULL,
  `valor_unitario` DECIMAL(9,2) NOT NULL,
  `subtotal` DECIMAL(9,2) NOT NULL,
  `nome_produto` VARCHAR(255) NULL,
  `venda_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  PRIMARY KEY (`produto_id`, `venda_id`),
  INDEX `fk_venda_idx` (`venda_id` ASC) VISIBLE,
  CONSTRAINT `fk_venda`
    FOREIGN KEY (`venda_id`)
    REFERENCES `TESTE`.`venda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `TESTE`.`produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);