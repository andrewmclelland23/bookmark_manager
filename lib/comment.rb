require_relative 'database_connection_setup'

class Comment

  attr_reader :id, :text, :bookmark_id

  def initialize(id, text, bookmark_id)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end

  def self.add(text, id)
    result = DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES ('#{text}', '#{id}') RETURNING id, text, bookmark_id")
    Comment.new(result[0]['id'], result[0]['text'], result[0]['bookmark_id'])
  end

  def self.find(bookmark_id)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = '#{bookmark_id}'")
    return result.map do |record|
      Comment.new(record['id'], record['text'], record['bookmark_id'])
    end
  end

  def self.delete(bookmark_id)
    DatabaseConnection.query("DELETE FROM comments WHERE bookmark_id = '#{bookmark_id}'")
  end
end
