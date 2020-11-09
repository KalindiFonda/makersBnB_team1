
feature 'see a list of cats' do
  scenario 'user visits homepage and sees cats' do
    insert_cat
    visit('/')
    expect(page).to have_content("Snuggles")
  end
end
