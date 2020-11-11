\c cat_manager;
CREATE TABLE users (id SERIAL PRIMARY KEY,
                  name VARCHAR(30),
                  email VARCHAR(60),
                  password VARCHAR(140)
                );
