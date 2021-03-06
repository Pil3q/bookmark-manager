require 'bookmark'

describe Bookmark do
  it 'should have a class method to retreive all bookmarks' do
    bookmark = Bookmark.add(url: 'http://makersacademy.com')
    expect(Bookmark.all).to include bookmark
  end

  it 'will find added bookmark' do
    bookmark = Bookmark.add(url: 'http://makersacademy.com', title: 'makers')
    expect(Bookmark.find(title:'makers')).to eq bookmark
  end

  it 'deletes bookmarks' do
    bookmark = Bookmark.add(url: 'http://makersacademy.com', title: 'makers')
    Bookmark.delete(url: 'http://makersacademy.com', title: 'makers')
    expect(Bookmark.all).not_to include bookmark
  end
end
