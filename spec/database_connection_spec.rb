require 'database_connection'

describe DatabaseConnection do
  describe('.setup') do
    it 'should create a db connection to the db passed in as an argument' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe('.query') do
    it 'should query a database' do
      DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.instance).to receive(:exec).with('SELECT * FROM bookmarks')
      DatabaseConnection.query('SELECT * FROM bookmarks')

    end
  end
end
