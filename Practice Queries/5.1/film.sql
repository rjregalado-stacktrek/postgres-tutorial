SELECT
  film_id,
  CONCAT(title, ' (', rating, ')') AS poster_title,
  description
FROM
  film
ORDER BY
  poster_title DESC
LIMIT 20;

