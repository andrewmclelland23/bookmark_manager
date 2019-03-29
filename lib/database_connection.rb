require 'pg'

class DatabaseConnection
  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.instance
    @connection
  end

  def self.query(sql_string)
    @connection.exec(sql_string)
  end
end
