\c cat_manager_test
CREATE TABLE cats (id SERIAL PRIMARY KEY,
                  name VARCHAR(30),
                  description VARCHAR(200),
                  picture VARCHAR(60),
                  price NUMERIC,
                  user_id INTEGER REFERENCES users (id)
                )
