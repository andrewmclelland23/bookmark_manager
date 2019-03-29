feature 'url validation' do
  scenario 'A user sees an error message when invalid url is entered' do

    add_bookmark('test', 'sfgdfdgf')
    expect(page).to_not have_content "test"
    expect(page).to have_content 'Invalid URL entered'
  end
end
