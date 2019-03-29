require 'bookmarks'

describe Bookmarks do

  subject(:list) { described_class }

  describe '#display_list' do
    it 'Should return list of bookmarks' do
      bm1 = Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
      bm2 = Bookmarks.add_bookmark('http://www.destroyallsoftware.com', 'Destroy Software')

      bookmarks = list.display_all
      expect(bookmarks.first.title).to eq bm1.title
      expect(bookmarks.first.url).to eq bm1.url
      expect(bookmarks.first.id).to eq bm1.id
      expect(bookmarks.last.title).to eq bm2.title
      expect(bookmarks.last.url).to eq bm2.url
      expect(bookmarks.last.id).to eq bm2.id
    end
  end

  describe '#add_bookmark' do
    it 'Should add a bookmarks if url is valid' do
      bookmark = list.add_bookmark('http://www.google.com', 'Google')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Google'
      expect(bookmark.url).to eq 'http://www.google.com'
    end
    it 'Should not add a bookmark if url is invalid' do
      bookmark = list.add_bookmark('www.google.com', 'Google')

      expect(Bookmarks.display_all).to eq []
    end
  end

  describe '#delete_bookmark' do
    it 'should delete a bookmark from the database' do
      bm = Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
      Bookmarks.delete_bookmark(id: bm.id)
      expect(Bookmarks.display_all).to eq []
    end
  end

  describe '#update_bookmark' do
    it 'should udpate a bookmark in the database' do
      bm = Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers')
      Bookmarks.update_bookmark(title: 'Snakers', url: 'http://www.snakersacademy.com', id: bm.id)
      updated_bm = Bookmarks.display_all.first
      expect(updated_bm.title).to eq 'Snakers'
      expect(updated_bm.url).to eq 'http://www.snakersacademy.com'
      expect(updated_bm.id).to eq bm.id
    end
  end

  describe 'find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmarks.add_bookmark('http://www.makersacademy.com', 'Makers Academy')

      result = Bookmarks.find(id: bookmark.id)

      expect(result).to be_a Bookmarks
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end
end
