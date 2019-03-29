require 'pg'
require_relative 'database_connection_setup'

class Bookmarks

  attr_reader :title, :url, :id

  def initialize(title, url, id)
    @title = title
    @url = url
    @id = id
  end

  def self.display_all
    DatabaseConnection.query("SELECT * FROM bookmarks;").map do |bookmark|
      Bookmarks.new(bookmark['title'], bookmark['url'], bookmark['id'])
    end
  end

  def self.add_bookmark(url, title)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmarks.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end

  def self.delete_bookmark(id:)
  DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update_bookmark(title:, url:, id:)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}'")
  end

  def self.find(id:)
    result = DatabaseConnection.query("Select * FROM bookmarks WHERE id = #{id};")
    Bookmarks.new(result[0]['title'], result[0]['url'], result[0]['id'])
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
