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

