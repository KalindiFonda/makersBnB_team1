feature "add the cat's profile" do
  scenario 'user visits add page and creates a new cat profile' do
    visit('/add') # cat id 1
    fill_in 'name', :with => 'Tiddles'
    fill_in 'description', :with => 'Gorgeous tabby'
    fill_in 'picture', with: 'https://placekitten.com/g/200/300'
    fill_in 'price', with: '400'
    click_button('Submit')
    expect(page).to have_content("Tiddles")
    expect(page).to have_content("Gorgeous tabby")
    expect(page).to have_content("400")
  end
end
