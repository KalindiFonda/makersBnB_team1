\c cat_manager
CREATE TABLE cats (id SERIAL PRIMARY KEY,
                  name VARCHAR(30),
                  description VARCHAR(200),
                  picture VARCHAR(60),
                  price NUMERIC
                )
