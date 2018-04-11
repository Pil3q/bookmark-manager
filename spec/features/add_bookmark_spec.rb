feature 'Should be able to add a bookmark' do
  scenario 'Submission box should accept url and add it to list' do
    visit('/add_bookmark')
    fill_in('url', :with => 'http://mylittlepony.com' )
    fill_in('title', :with => 'pony' )
    click_button 'Submit'
    expect(page).to have_content 'pony'
  end
end
feature 'url validation' do
  scenario 'should throw an error while not valid url' do
    visit('/add_bookmark')
    fill_in('url', :with => 'mylittlepony' )
    click_button 'Submit'
    expect(page).to have_content 'mylittlepony is not valid URL'
  end
end
