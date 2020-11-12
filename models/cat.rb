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
    result = DatabaseConnection.query('SELECT * FROM cats;')
    result.map { |cat |
      Cat.new(id: cat['id'], name: cat['name'], description: cat['description'],
              picture: cat['picture'], price: cat['price']) }
  end

  def self.find_by(id:)
    result = DatabaseConnection.query("SELECT * FROM cats WHERE id=#{id};")
    result.map { |cat| new(id: cat["id"], name: cat["name"], description: cat["description"],
                picture: cat["picture"], price: cat["price"])}.first
  end

  def self.create(name: ,description: , picture: , price: )
    result = DatabaseConnection.query("INSERT INTO cats (name, description, picture, price)
              VALUES ('#{name}', '#{description.gsub("'"){"''"}}', '#{picture}', '#{price}') RETURNING id, name, description, picture, price;")
    Cat.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'],
            picture: result[0]['picture'], price: result[0]['price'])
  end

  # private
  #
  # def create_cat_instance(params)
  #   new(id: params["id"], name: params["name"], description: params["description"],
  #               picture: params["picture"], price: params["price"])
  # end

end
