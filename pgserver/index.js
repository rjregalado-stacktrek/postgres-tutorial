/**
 * npm install dotenv pg
 * 
  PG_HOST=localhost
  PG_PORT=5432
  PG_DATABASE=mydatabase
  PG_USER=myuser
  PG_PASSWORD=mypassword

 */

require('dotenv').config();

const express = require('express');
const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  database: process.env.PG_DATABASE,
  password: process.env.PG_PASSWORD,
  port: process.env.PG_PORT,
});


const app = express();
const bodyParser = require('body-parser');
const PORT = 3000;

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);


app.get('/', (request, response) => {
  response.json({ info: 'CRUD app with PostgreSQL and Node.js' });
});

app.get('/users', (request, response) => {
  pool.query('SELECT * FROM users ORDER BY id ASC', (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
});

app.get('/users/:id', (request, response) => {
  const id = parseInt(request.params.id);
  pool.query('SELECT * FROM users WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).json(results.rows);
  });
});

app.post('/users', (request, response) => {
  const { name, email } = request.body;
  pool.query(
    'INSERT INTO users (name, email) VALUES ($1, $2) RETURNING *',
    [name, email],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(201).send(`User added with ID: ${results.rows[0].id}`);
    }
  );
});

app.put('/users/:id', (request, response) => {
  const id = parseInt(request.params.id);
  const { name, email } = request.body;
  pool.query(
    'UPDATE users SET name = $1, email = $2 WHERE id = $3',
    [name, email, id],
    (error, results) => {
      if (error) {
        throw error;
      }
      response.status(200).send(`User ${id} updated`);
    }
  );
});

app.delete('/users/:id', (request, response) => {
  const id = parseInt(request.params.id);
  pool.query('DELETE FROM users WHERE id = $1', [id], (error, results) => {
    if (error) {
      throw error;
    }
    response.status(200).send(`User ${id} deleted`);
  });
});

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}`);
});
