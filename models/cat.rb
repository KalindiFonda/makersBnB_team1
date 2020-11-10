require 'pg'

class Cat

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'cat_manager_test')
    else
      connection = PG.connect(dbname: 'cat_manager')
    end
    result = connection.exec('SELECT * FROM cats;')
    result.map { |cat | cat }
  end

  def self.find_by(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'cat_manager_test')
    else
      connection = PG.connect(dbname: 'cat_manager')
    end

    result = connection.exec("SELECT * FROM cats WHERE id=#{id};")
    result.map { |cat| cat }.first
  end

end
