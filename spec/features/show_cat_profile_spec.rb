feature "see the cat's profile" do
  scenario 'user visits catpage and sees cats profile' do
    insert_cat
    visit('/cats/1') # cat id 1
    expect(page).to have_content("Snuggles")
    expect(page).to have_content("Dates Available")
    # no info under dates available
    expect(page).to have_content("Book")
  end

  scenario 'show calendar' do
    insert_cat
    visit('/cats/1') # cat id 1
    fill_in 'start_date', with: '2020-11-10'
    fill_in 'end_date', with: '2020-11-14'
    click_button 'Book'
    expect(page).to have_content("Booked")
  end

end
