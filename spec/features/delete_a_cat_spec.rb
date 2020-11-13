feature 'Deleting a cat' do
  scenario 'A user can delete a cat' do
    User.create(email: 'test@example.com', password: 'password123')
    visit '/users/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Submit')
    click_button('Add Cat')
    fill_in(:name, with: 'Henry')
    fill_in(:description, with: 'A real gent')
    fill_in(:picture, with: 'https://placekitten.com/g/600/300')
    fill_in(:price, with: '500')
    click_button('Create New Cat')

    visit('/cat/#{id}')
    expect(page).to have_content(name: "Henry", description: "A real gent"] ,
      picture: "https://placekitten.com/g/600/300", price: "500")

    first('.cat').click_button 'Delete'

    expect(current_path).to eq '/my_cats'
    expect(page).not_to have_link(name: "Henry", description: "A real gent"] ,
      picture: "https://placekitten.com/g/600/300", price: "500")
  end
end
