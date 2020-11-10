require 'pg'

class Cat

  attr_reader :id, :name, :description, :picture, :price

  def initialize(id: , name: , description: , picture: , price: )
    @id = id
    @name = name
    @description = description
    @picture = picture
    @price = price
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'cat_manager_test')
    else
      connection = PG.connect(dbname: 'cat_manager')
    end
    result = connection.exec('SELECT * FROM cats;')
    result.map { |cat |
      Cat.new(id: cat['id'], name: cat['name'], description: cat['description'],
              picture: cat['picture'], price: cat['price']) }
  end

  def self.find_by(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'cat_manager_test')
    else
      connection = PG.connect(dbname: 'cat_manager')
    end

    result = connection.exec("SELECT * FROM cats WHERE id=#{id};")
    result.map { |cat| new(id: cat["id"], name: cat["name"], description: cat["description"],
                picture: cat["picture"], price: cat["price"])}.first
  end

  def self.create(name: ,description: , picture: , price: )
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'cat_manager_test')
    else
      connection = PG.connect(dbname: 'cat_manager')
    end
    result = connection.exec("INSERT INTO cats (name, description, picture, price)
              VALUES ('#{name}', '#{description}', '#{picture}', #{price}) RETURNING id, name, description, picture, price")
    Cat.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'],
            picture: result[0]['picture'], price: result[0]['price'])
  end

end
