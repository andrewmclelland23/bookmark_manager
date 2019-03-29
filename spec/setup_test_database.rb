require 'pg'

def test_db_setup

  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Clear the bookmarks table
  connection.exec("DROP TABLE comments;")
  connection.exec("DROP TABLE bookmarks;")
  connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(50));")
  connection.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER, FOREIGN KEY (bookmark_id) REFERENCES bookmarks(id));")
end
