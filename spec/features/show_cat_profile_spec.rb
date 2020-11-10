feature "see the cat's profile" do
  scenario 'user visits catpage and sees cats profile' do
    insert_cat
    visit('/cats/1') # cat id 1
    expect(page).to have_content("Snuggles")
    expect(page).to have_content("Dates Available")
    # no info under dates available
    expect(page).to have_content("Book")
  end
end
