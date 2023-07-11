CREATE DATABASE construction_shop;

DROP TABLE IF EXISTS products;

-- Create a table to store the products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price DECIMAL(10, 2),
  quantity INTEGER,
  image VARCHAR(255)
);

SELECT * FROM products;

INSERT INTO products(title, price, quantity, image) 
VALUES('product 1', 150, 2, 'image1'),
	('product 2', 250, 1, 'image2'),
	('product 3', 350, 3, 'image3'),
	('product 4', 450, 5, 'image4');
	
SELECT * FROM products;

--QUERIES--

--Statement_Reference column1, column2,... columnN 
--FROM table_name
--WHERE [condition]

SELECT * FROM products
WHERE title = 'product 2';

--UPDATE---

UPDATE products
SET price = 1050
WHERE title='product 1';

--DELETE FROM table_name
--[WHERE condition];

DELETE FROM products
WHERE title = 'product 1';

SELECT * FROM products


--SELECT column1, column2….
--FROM table_name
--ORDER BY column1 ASC/DESC, column2 ASC/DESC;

SELECT * FROM products
ORDER BY title DESC;

SELECT title, price FROM products
ORDER BY title ASC;

--SELECT column1, column 2…
--FROM table_name
--WHERE [condition]
--GROUP BY column1, column2

SELECT title, Sum(price)
FROM products
GROUP BY title;

--SELECT DISTINCT column1, column2….
--FROM table_name
--ORDER BY column1, column2;

SELECT DISTINCT title
FROM products
ORDER BY title;

--SELECT column1, column2
--FROM table1, table2
--WHERE [ conditions ]
--GROUP BY column1, column2
--HAVING [ conditions ]
--ORDER BY column1, column2

SELECT title FROM products GROUP BY title HAVING count(title) >= 2;

SELECT * FROM products

--Aggregate Functions---

--AVERAGE--
SELECT id, title, AVG(price) AS avg_price_for_product
FROM products
GROUP BY id, title;

--SUM--
SELECT id, title, SUM(price) AS sum_price
FROM products
GROUP BY id, title;

--WINDOWS FUNCTIONS--
--PARTITION

SELECT id, title, quantity, SUM(price) OVER
         (PARTITION BY title ORDER BY quantity)
         AS running_total_price
  FROM products


--SELECT expression_1, expression_2, ... expression_n
--FROM tables
--[WHERE condition(s)]
--UNION
--SELECT expression_1, expression_2, ... expression_n
--FROM tables
--[WHERE condition(s)];

SELECT title
FROM products
UNION 
SELECT name
FROM users;

SELECT * FROM users;
SELECT * FROM products;


INSERT INTO users(name, email) VALUES ('Juana Dela Cruz','juan@gmail.com'),
			('Rodney Santos','maria@gmail.com');

SELECT title
FROM products
UNION ALL
SELECT name
FROM users;

--SELECT <column_names>
--FROM <table_name>
--LIMIT <row_count> OFFSET <rows_to_skip>;

SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

SELECT * FROM products
ORDER BY id
LIMIT 5 OFFSET 2;

INSERT INTO products(title, price, quantity, image) 
VALUES('product 5', 1150, 1, 'image5'),
	('product 6', 1250, 1, 'image6'),
	('product 7', 1350, 3, 'image7'),
	('product 8', 1450, 5, 'image8');
	
	
--COALESCE---
SELECT COALESCE(null, 8, 9, null, 10 );

-------------CONSTRAINT--------------------

--NOT NULL Constraint − Ensures that a column cannot have NULL value.

--UNIQUE Constraint − Ensures that all values in a column are different.

--PRIMARY Key − Uniquely identifies each row/record in a database table.

--FOREIGN Key − Constrains data based on columns in other tables.

--CHECK Constraint − The CHECK constraint ensures that all values in a column satisfy certain conditions.

--EXCLUSION Constraint − The EXCLUDE constraint ensures that if any two rows are compared on the specified column(s) or expression(s) using the specified operator(s), not all of these comparisons will return TRUE.

CREATE TABLE employee1(
    emp_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender 	CHAR(1),
    birthdate DATE,
    email  VARCHAR(100),
    salary INT);
	
select * from employee

--UNIQUE CONSRAINT---

CREATE TABLE employee2(
   ID SERIAL PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL UNIQUE,
   ADDRESS        CHAR(50),
   SALARY         REAL    DEFAULT 50000.00
);

--PRIMARY KEY Constraint

CREATE TABLE employee3(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

--FOREIGN KEY Constraint

CREATE TABLE Company(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

CREATE TABLE DEPARTMENT1(
   ID INT PRIMARY KEY      NOT NULL,
   DEPT           CHAR(50) NOT NULL,
   EMP_ID         INT      references Company(ID)
);


--DROPPING CONSRAINT--

ALTER TABLE table_name DROP CONSTRAINT some_name;










	
	


