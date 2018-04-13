feature 'Updating bookmark' do
  scenario 'find by url update url' do
    add_pony_bookmark
    click_button 'Update bookmark'
    fill_in('url', :with => 'http://mylittlepony.com' )
    click_button 'Submit'
    fill_in('url', :with => 'http://newlink.com' )
    click_button 'Submit'
    expect(page).to have_link('pony', :href => "http://newlink.com")
  end
  scenario 'find by title update url' do
    add_pony_bookmark
    click_button 'Update bookmark'
    fill_in('title', :with => 'pony' )
    click_button 'Submit'
    fill_in('url', :with => 'http://newlink.com' )
    click_button 'Submit'
    expect(page).to have_link('pony', :href => "http://newlink.com")
  end
  scenario 'find by title update title' do
    add_pony_bookmark
    click_button 'Update bookmark'
    fill_in('title', :with => 'pony' )
    click_button 'Submit'
    fill_in('title', :with => 'donkey' )
    click_button 'Submit'
    expect(page).to have_link('donkey', :href => "http://mylittlepony.com")
  end
  scenario 'find by url update title' do
    add_pony_bookmark
    click_button 'Update bookmark'
    fill_in('url', :with => 'http://mylittlepony.com' )
    click_button 'Submit'
    fill_in('title', :with => 'donkey' )
    click_button 'Submit'
    expect(page).to have_link('donkey', :href => "http://mylittlepony.com")
  end
end
