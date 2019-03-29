feature 'adding comments on bookmarks' do
  scenario 'A user can add a comment on a bookmarks and see it below' do
    add_2_bookmarks
    visit '/bookmarks'
    first('.bookmark').click_button 'Add Comment'
    fill_in 'text', with: 'test comment text'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content 'test comment text'
  end
end
