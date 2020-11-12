\c cat_manager_test

CREATE TABLE bookings (
	id serial PRIMARY KEY,
	cat_id INTEGER REFERENCES cats (id),
	booking_start DATE NOT NULL,
	booking_end DATE NOT NULL,
  user_id INTEGER REFERENCES users (id),
	status VARCHAR(10)
);
