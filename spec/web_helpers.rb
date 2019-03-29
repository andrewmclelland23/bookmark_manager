def add_2_bookmarks
  visit '/'
  click_link 'Add Bookmark'
  fill_in('url', with: 'http://www.bbc.co.uk')
  fill_in('title', with: 'BBC')
  click_button 'Submit'

  visit '/'
  click_link 'Add Bookmark'
  fill_in('url', with: 'http://www.google.co.uk')
  fill_in('title', with: 'Google')
  click_button 'Submit'
end

def add_bbc_bookmark
  visit '/'
  click_link 'Add Bookmark'
  fill_in('url', with: 'http://www.bbc.co.uk')
  fill_in('title', with: 'BBC')
  click_button 'Submit'
end

def add_bookmark(title, url)
  visit '/'
  click_link 'Add Bookmark'
  fill_in('url', with: url)
  fill_in('title', with: title)
  click_button 'Submit'
end
