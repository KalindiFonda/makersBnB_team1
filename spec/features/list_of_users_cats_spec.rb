feature 'Users list of cats' do
  scenario 'A user can see a list of their cats' do
    insert_cat
    User.create(email: 'test@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Submit')
    click_button('My Account')
    expect(page).to have_content("Snuggles")
    expect(page).to have_content("Best to snuggle to")
    # expect(page).to have_content("https://placekitten.com/g/600/300")
    expect(page).to have_content("1000000")
    click_button('Submit')

  end
end
