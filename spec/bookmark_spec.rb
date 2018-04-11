require 'bookmark'

describe Bookmark do
  it 'should have a class method to retreive all bookmarks' do
    bookmark = Bookmark.add(url: 'http://makersacademy.com')
    expect(Bookmark.all).to include bookmark
  end


end
