DROP TABLE IF EXISTS bikes;
DROP TABLE IF EXISTS manufacturers;


CREATE TABLE manufacturers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE bikes(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  manufacturer_id INT REFERENCES manufacturers(id),
  cost INT,
  quantity INT
);
