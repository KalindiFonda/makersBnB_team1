require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'cat_manager_test')
  connection.exec("TRUNCATE cats;")
end
