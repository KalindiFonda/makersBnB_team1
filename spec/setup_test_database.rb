require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'cat_manager_test')
  connection.exec("TRUNCATE cats, bookings, users;")
end

def insert_cat(name = 'Snuggles', description = 'Best to snuggle to',
  picture = 'https://placekitten.com/g/600/300', price = 1000000000)
  Cat.create(name: name, description: description, picture: picture, price: price)
end
