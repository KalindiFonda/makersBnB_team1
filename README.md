# CatRental - team 1:


Basic specifications:


MVP:
- list of available cats
- post cats
  - name, description, price/night
  - availability (calendar) true/false

- user registration/logging in (username & pass)

HOST
  - lists cats (1 or more)
  - confirmation: approval/no approval --> block off the calendar, no other person can book

GUEST
  - book a cat

User Stories:

```
As a user;
So that I can choose a cat,
I want to see a list of available cats.
```
```
As a cat owner
So that Guests can see my cats
I want to be able to add a cat profile
```
```
As a cat friend
So that I can pick a cat
I want to be able to see the cats' name, description and price
```
```
As a cat friend
So that I book a cat
I want to be able to check the cats availability
```
```
As a cat friend
So that I can spend a weekend
I want to be able to book a cat
```
```
As a cat owner
So that the cat friend can pick up the cat
I want to be able to confirm the booking
```
```
As a cat friend
So that I can pick the cat up
I want to receive a confirmation on my booking
```
```
As a user
So that I can view and post cats
I want to be able to make an account
```


### What is going on?
[link to rake setup](https://github.com/sinatra/sinatra-recipes/blob/master/databases/postgresql-activerecord.md)



### How to set up db:
In db/migrate go through 01-03 for test_db and db with this command:
```
psql -f db/migrate/00_setup.sql
```
```
psql -f db/migrate/00_setup_test.sql
```



### Booking Setup:

| ID | cat_ID | booking_start | booking_end | (future)user_id   |
|:----:|:----:|:----:|:----:|:----:|


to add bookings table:
```
psql -f db/migrate/04_create_bookings_table_test.sql
psql -f db/migrate/04_create_bookings_table.sql
```
