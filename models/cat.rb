require 'pg'

class Cat 

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'cat_manager_test')
    else
      connection = PG.connect(dbname: 'cat_manager')
    end
    result = connection.exec('SELECT * FROM cats')
    result.map {  |cat | cat.values }
  end



end
