feature 'Deleting bookmark' do
  scenario 'add and delete' do
    add_pony_bookmark
    click_button 'Delete bookmark'
    fill_in('url', :with => 'http://mylittlepony.com' )
    click_button 'Submit'
    expect(page).not_to have_link('pony', :href => "http://mylittlepony.com")
  end
end
