# Revisão - Atividade avaliativa 2
## *1 - DDLs*
Comandos de criação de tabelas, alterações de estrutura e modelagem. **`CREATE`**, **`ALTER`**, **`DROP`**, **`TRUNCATE`**, **`COMMENT`**.

## `CREATE`
Comando de **criação** de objetos.

> i) CREATE TABLE IF NOT EXISTS tabela_exemplo { };

> ii) CREATE DATABASE IF NOT EXISTS bd_exemlo;

> iii) CREATE INDEX IF NOT EXISTS idx_autor ON livros (autor);

"IF NOT EXISTS" - Serve para especificar a criação da tabela apenas se já não existir uma com mesmo nome, evitando conflitos.

## `ALTER`
Comando de edição/modificação de objetos.
-   **Adicionar ou Remover Colunas:**  Para ajustar a estrutura de uma tabela.
-   **Modificar Tipos de Dados:**  Para atender a novas necessidades.
-   **Gerenciar Índices:**  Para melhorar ou simplificar consultas.

> i) ALTER TABLE livros ADD COLUMN editora VARCHAR(150);

> ii) ALTER TABLE livros MODIFY COLUMN titulo TEXT;

> iii) ALTER TABLE livros RENAME COLUMN autor TO nome_autor;

> iv) ALTER TABLE livros CHANGE descricao desc_livro text;

> v) ALTER TABLE livros DROP COLUMN genero;

> vi) ALTER TABLE livros ADD INDEX idx_editora (editora);

## `DROP`
O comando **DROP** remove permanentemente objetos do banco de dados.
-   Remover  **bancos de dados**, tabelas ou índices que não são mais necessários.
-   Combine com  `IF EXISTS`  para evitar erros ao tentar remover objetos inexistentes.

> i) DROP DATABASE IF EXISTS biblioteca;

> ii) DROP TABLE IF EXISTS livros;

> iii) DROP INDEX IF EXISTS idx_autor ON livros;

## `TRUNCATE`
O comando **TRUNCATE** remove todos os registros de uma tabela, mas preserva sua estrutura. "Limpa" a tabela para reutilizar.

> i) TRUNCATE TABLE tabela_nome;

- `TRUNCATE` não dispara gatilhos (`triggers`) e não pode ser revertido com `ROLLBACK`.

## `RENAME`
O comando  **RENAME**  altera o nome de tabelas e outros objetos no banco de dados.

> i) RENAME TABLE tabela_antiga TO tabela_nova;

-   Renomear objetos frequentemente pode dificultar a manutenção, então use com moderação.

## `COMMENT`
O comando  **COMMENT**  adiciona ou altera comentários em tabelas e colunas, documentando o propósito de cada elemento.

> ALTER TABLE livros COMMENT = 'Tabela que armazena informações sobre livros.';

> ALTER TABLE livros MODIFY titulo VARCHAR(255) COMMENT 'Título do livro';
-   Documente tabelas e colunas críticas para facilitar a manutenção. Evitar comentários redundantes.
---
## *2 - DMLs*

A Data Manipulation Language (DML) é uma sublinguagem do SQL usada para manipular dados em um banco de dados. Este manual abrange os comandos DML mais utilizados, **`INSERT`**, **`UPDATE`**, **`DELETE`** e **`REPLACE`**, que são essenciais para a inserção, atualização, remoção e substituição de registros.

## `INSERT`
O comando  **`INSERT`**  adiciona novos registros a uma tabela.
- Inserção de múltiplos registros. 
> INSERT INTO clientes (nome, idade, email)
	VALUES 
    ('Pedro Souza', 35, 'pedro.souza@email.com'),
    ('Carla Mendes', 40, 'carla.mendes@email.com');

## `UPDATE`
O comando  **`UPDATE`**  modifica dados existentes em uma tabela.
**-   Sempre use a cláusula  `WHERE`  para evitar alterações em todos os registros.**

- **UPDATE** de um único registro:

> UPDATE clientes
	SET idade = 29
	WHERE nome = 'Ana Lima';
	
- Atualizar registros com **base em uma condição**:
> UPDATE clientes
	SET ativo = 0
	WHERE idade > 35;

 ## `DELETE`
O comando  **`DELETE`**  remove registros de uma tabela.

Utilize  `DELETE`  com cuidado, especialmente sem a cláusula  `WHERE`.
Para excluir todos os registros sem remover a tabela, use:
 `DELETE FROM tabela;`

- **Deletar um único registro:**

> DELETE FROM clientes
	WHERE nome = 'Carla Mendes';

- **Deletar múltiplos registros:**

> DELETE FROM clientes
	WHERE ativo = 0;

 ## `REPLACE`
O comando  **`REPLACE`**  insere um novo registro ou substitui um existente caso haja um conflito de chave única.
-   Útil para evitar duplicação de dados ao trabalhar com chaves únicas.
-   Substitui o registro existente deletando-o e inserindo um novo.

> REPLACE INTO clientes (id, nome, idade, email)
	VALUES (1, 'Ana Lima', 30, 'ana.lima@email.com');
---
## *3 - DQLs*
## `SELECT`  e  `FROM`
