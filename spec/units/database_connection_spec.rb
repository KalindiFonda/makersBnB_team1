require './models/database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up the connection with the database' do
      expect(PG).to receive(:connect).with(dbname: 'cat_manager_test')
      DatabaseConnection.setup('cat_manager_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('cat_manager_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'runs the query via PG' do
      connection = DatabaseConnection.setup('cat_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM cats')
      DatabaseConnection.query('SELECT * FROM cats')
    end
  end

end
