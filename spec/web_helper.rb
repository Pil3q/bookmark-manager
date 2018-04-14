def add_pony_bookmark
  visit('/add_bookmark')
  fill_in('url', :with => 'http://mylittlepony.com' )
  fill_in('title', :with => 'pony' )
  click_button 'Submit'
end
def add_makers_bookmark
  visit('/add_bookmark')
  fill_in('url', :with => 'http://makersacademy.com' )
  fill_in('title', :with => 'makers' )
  click_button 'Submit'
end
def add_funny_useful_tags
  click_button 'Add a tag'
  fill_in('tag', :with => 'funny' )
  click_button 'Submit'
  click_button 'Add a tag'
  fill_in('tag', :with => 'useful' )
  click_button 'Submit'
end
def add_useful_to_makers
  click_button 'Add a tag to the bookmark'
  fill_in('url', :with => 'http://makersacademy.com' )
  fill_in('title', :with => 'makers' )
  click_button 'Submit'
  fill_in('tag', :with => 'useful' )
  click_button 'Submit'
end
def add_funny_to_makers
  click_button 'Add a tag to the bookmark'
  fill_in('url', :with => 'http://makersacademy.com' )
  fill_in('title', :with => 'makers' )
  click_button 'Submit'
  fill_in('tag', :with => 'funny' )
  click_button 'Submit'
end
