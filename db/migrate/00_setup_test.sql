CREATE DATABASE "cat_manager_test";
\c cat_manager_test
CREATE TABLE cats (id SERIAL PRIMARY KEY,
                  name VARCHAR(30),
                  description VARCHAR(200),
                  picture VARCHAR(60),
                  price NUMERIC
                );

INSERT INTO cats (name, description, picture, price)
VALUES ('Snuggles',
  'Best to snuggle to',
  'https://placekitten.com/g/600/300',
  1000000);
