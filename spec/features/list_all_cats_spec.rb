
feature 'see a list of cats' do
  scenario 'user visits homepage and sees cats' do
    insert_cat
    visit('/')
    expect(page).to have_content("Snuggles")
    expect(page).to have_content("Best to snuggle to")
    expect(page).to have_content("https://placekitten.com/g/600/300")
    expect(page).to have_content("1000000")
  end
end
