require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'cat_manager_test')
  connection.exec("TRUNCATE cats, bookings;")
end

def insert_cat
  connection = PG.connect(dbname: 'cat_manager_test')
  connection.exec("INSERT INTO cats (name, description, picture, price)
  VALUES ('Snuggles',
    'Best to snuggle to',
    'https://placekitten.com/g/600/300',
    1000000);")
end
