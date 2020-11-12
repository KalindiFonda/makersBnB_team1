\c cat_manager_test;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  email VARCHAR(60),
  password VARCHAR(140)
                );


-- INSERT INTO users (name, email, password)
--   VALUES ('Peter',
--           'test@test.com',
--           'password'
--            );
