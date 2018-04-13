def add_pony_bookmark
  visit('/add_bookmark')
  fill_in('url', :with => 'http://mylittlepony.com' )
  fill_in('title', :with => 'pony' )
  click_button 'Submit'
end
