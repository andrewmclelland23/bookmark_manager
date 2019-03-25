require 'bookmarks'

describe Bookmarks do

  subject(:list) { described_class }

  describe '#display_list' do
    it 'Should return list of bookmarks' do
      expect(list.display_all).to eq([
      "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com"
     ])
    end
  end

end