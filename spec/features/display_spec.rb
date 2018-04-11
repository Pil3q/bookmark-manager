feature 'It should display our hardcoded links' do
  scenario 'We visit the homepage and see our bookmarks' do
    Bookmark.add(url: 'http://makersacademy.com', title: 'makers')
    visit('/')
    expect(page).to have_link('makers', :href => "http://makersacademy.com")
  end
end
