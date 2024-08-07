# Database Normalization Project

## Objective

This project aims to normalize an existing database to enhance data efficiency and integrity. Normalization is a crucial process in database design that seeks to reduce redundancy and eliminate unwanted dependencies, ensuring that data is stored in an organized and consistent manner.

## Project Structure

### Normalization to 1st Normal Form (1NF)

The `Cliente` table was identified as not being in 1st Normal Form due to the presence of a multivalued field, specifically the `telefone` field. To meet 1NF, the `Cliente` table was modified to remove the multivalued field, and a new table, `TelefoneCliente`, was created. This new table stores phone numbers in separate records, establishing a one-to-many relationship with the `Cliente` table.

### Normalization to 2nd Normal Form (2NF)

The `Item_venda` table exhibited a partial dependency on the composite primary key consisting of `produto_id` and `venda_id`. The `nome_produto` field depended solely on `produto_id`, not on `venda_id`. To achieve 2NF, a new table, `Produto`, was created to store information about products, including `nome_produto`. The `Item_venda` table now contains only attributes related to the specific sale.

### Normalization to 3rd Normal Form (3NF)

The `venda` table was not in 3rd Normal Form due to a transitive dependency involving `funcionario_id` and `cargo_id`. To address this, additional tables were created: `pagamento`, `venda_cliente`, and adjustments were made to the `venda` table to remove the transitive dependency. The new structure ensures that all transitive dependencies have been eliminated, and the `venda` table is organized according to 3NF.

## Normalization Scripts

The provided scripts implement the necessary changes to normalize the database as described above. They include the creation of new tables and the removal of obsolete columns and foreign keys to ensure compliance with normal forms.

# Projeto de Normalização de Banco de Dados-Traduzido:

## Objetivo

Este projeto visa normalizar um banco de dados existente para melhorar a eficiência e a integridade dos dados. A normalização é um processo essencial em design de banco de dados que visa reduzir redundâncias e eliminar dependências indesejadas, garantindo que os dados sejam armazenados de forma organizada e consistente.

## Estrutura do Projeto

### Normalização para a 1ª Forma Normal (1FN)

A tabela `Cliente` foi identificada como não estando na 1ª Forma Normal devido à presença de um campo multivalorado, especificamente o campo `telefone`. Para atender à 1FN, a tabela `Cliente` foi modificada para remover o campo multivalorado e uma nova tabela, `TelefoneCliente`, foi criada. Esta nova tabela armazena os números de telefone em registros separados, estabelecendo uma relação um-para-muitos com a tabela `Cliente`.

### Normalização para a 2ª Forma Normal (2FN)

A tabela `Item_venda` apresentava uma dependência parcial em relação à chave primária composta por `produto_id` e `venda_id`. O campo `nome_produto` dependia exclusivamente de `produto_id`, não de `venda_id`. Para alcançar a 2FN, foi criada uma nova tabela, `Produto`, que armazena informações sobre os produtos, incluindo o `nome_produto`. A tabela `Item_venda` agora possui apenas os atributos relacionados à venda específica.

### Normalização para a 3ª Forma Normal (3FN)

A tabela `venda` não estava na 3ª Forma Normal devido à presença de uma dependência transitiva envolvendo o `funcionario_id` e o `cargo_id`. Para resolver isso, foram criadas tabelas adicionais: `pagamento`, `venda_cliente`, e ajustes foram feitos na tabela `venda` para remover a dependência transitiva. A nova estrutura garante que todas as dependências transitivas foram eliminadas e a tabela `venda` está organizada de acordo com a 3FN.

## Scripts de Normalização

Os scripts fornecidos implementam as alterações necessárias para normalizar o banco de dados conforme descrito acima. Eles incluem a criação de novas tabelas e a remoção de colunas e chaves estrangeiras obsoletas para garantir a conformidade com as formas normais.
