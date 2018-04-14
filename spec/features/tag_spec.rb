feature 'Adding tag and sorting bookmarks' do
  scenario 'one tag for one bookmark' do
    add_pony_bookmark
    add_makers_bookmark
    add_funny_useful_tags
    add_useful_to_makers
    click_button 'Sort by tag'
    fill_in('tag', :with => 'useful' )
    click_button 'Submit'
    expect(page).not_to have_link('pony', :href => "http://mylittlepony.com")
  end
  scenario 'two tags for one bookmark' do
    add_pony_bookmark
    add_makers_bookmark
    add_funny_useful_tags
    add_useful_to_makers
    add_funny_to_makers
    click_button 'Sort by tag'
    fill_in('tag', :with => 'useful' )
    click_button 'Submit'
    expect(page).not_to have_link('pony', :href => "http://mylittlepony.com")
  end
end
