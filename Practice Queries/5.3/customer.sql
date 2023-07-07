SELECT
  c.first_name,
  c.last_name,
  CONCAT(a.district, ', ', a.postal_code) AS district_postal_code
FROM
  customer c
JOIN
  address a ON c.address_id = a.address_id
WHERE
  a.district <> '' AND a.postal_code <> ''
LIMIT 15;
