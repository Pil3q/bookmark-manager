feature 'Commenting' do
  scenario 'adding two comments for one bookmark' do
    add_pony_bookmark
    click_button 'Add a comment'
    fill_in('url', :with => 'http://mylittlepony.com' )
    click_button 'Submit'
    fill_in('comment', :with => 'What a pony?' )
    click_button 'Submit'
    click_button 'Add a comment'
    fill_in('url', :with => 'http://mylittlepony.com' )
    click_button 'Submit'
    fill_in('comment', :with => 'Commented again?' )
    click_button 'Submit'
    expect(page).to have_content 'What a pony? Commented again?'
  end
end
