require 'comment'

describe Comment do

  subject(:comment) { described_class }

  describe 'add' do
    it 'it should add a comment to the comments db' do
      conn = PG.connect(dbname: 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (title, url) VALUES ('test_title', 'http://www.test.co.uk')")
      comment = Comment.add('comment text', '1')
      expect(comment.id).to eq '1'
      expect(comment.text).to eq 'comment text'
      expect(comment.bookmark_id).to eq '1'
    end
  end

  describe 'find' do
    it 'it should find comments related to a bookmark id' do
      conn = PG.connect(dbname: 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (title, url) VALUES ('test_title', 'http://www.test.co.uk')")
      comment = Comment.add('comment text 1', '1')
      comment = Comment.add('comment text 2', '1')
      found_comments = Comment.find('1')
      expect(found_comments[0].id).to eq '1'
      expect(found_comments[1].id).to eq '2'
      expect(found_comments[0].text).to eq 'comment text 1'
      expect(found_comments[1].text).to eq 'comment text 2'
      expect(found_comments[0].bookmark_id).to eq '1'
      expect(found_comments[1].bookmark_id).to eq '1'
    end
  end
end
