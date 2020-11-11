feature "see the cat's profile" do
  scenario 'user visits catpage and sees cats profile' do
    cat = insert_cat
    visit("/cats/#{cat.id}") # cat id 1
    expect(page).to have_content("Snuggles")
    expect(page).to have_content("Dates Available")
    # no info under dates available
    expect(page).to have_content("Book")
    expect(page).not_to have_content("Error")
  end

  scenario 'Make a booking request' do
    cat = Cat.create(name: 'Prongs', description: 'The cutest kitten', picture: "https://placekitten.com/g/600/300", price: 500)
    visit("/cats/#{cat.id}")
    fill_in 'start_date', with: '2020-11-10'
    fill_in 'end_date', with: '2020-11-14'
    click_button 'Book'
    expect(current_path).to eq "/cats/#{cat.id}"
    expect(page).to have_content("You made a booking request.")
    expect(page).not_to have_content("Error")
    expect(page).to have_content("Prongs")
  end

end
