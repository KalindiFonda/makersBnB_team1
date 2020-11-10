require './models/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('cat_manager_test')
else
  DatabaseConnection.setup('cat_manager')
end
