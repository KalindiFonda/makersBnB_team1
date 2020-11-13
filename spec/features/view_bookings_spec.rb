feature 'View bookings' do
  scenario 'Users can view the status of booking requests' do
    cat = insert_cat
    user = User.create(email: 'test@example.com', password: 'password123')
    booking = Booking.create(cat_id: cat.id, booking_start: '10-10-2020', booking_end: '12-10-2020', user_id: user.id)
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Submit')
    visit "/myaccount/#{user.id}/bookings"
    expect(page).to have_content 'Snuggles'
    expect(page).to have_content 'PENDING'
  end
end
