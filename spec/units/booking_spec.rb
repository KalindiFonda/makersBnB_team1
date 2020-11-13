describe Booking do

  describe '.all' do
    it "shows all the events" do
      cat = insert_cat
      user = insert_user
      Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: user.id)
      all_bookings = Booking.all
      expect(all_bookings.length).to eq 1
      expect(all_bookings.first.cat_id).to eq cat.id
    end
  end

  describe '.create' do
    it " adds an entry to the booking table" do
      cat = Cat.create(name: 'Prongs', description: 'The cutest kitten', picture: "https://placekitten.com/g/600/300", price: 500)
      user = insert_user
      Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: user.id)
      all_bookings = Booking.all
      expect(all_bookings.first.cat_id).to eq cat.id
      expect(all_bookings.first.status).to eq "PENDING"
      expect(all_bookings.first.status).not_to eq nil
    end
  end

  describe '.change_status' do
    it "changes the status to CONFIRMED" do
      cat = insert_cat
      user = insert_user
      booking = Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: user.id)
      Booking.change_status(id: booking.id, status: "CONFIRMED")
      all_bookings = Booking.all
      expect(all_bookings.first.status).to eq "CONFIRMED"
    end

    it "changes the status to REJECTED" do
      cat = insert_cat
      user = insert_user
      booking = Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: user.id)
      Booking.change_status(id: booking.id, status: "REJECTED")
      all_bookings = Booking.all
      expect(all_bookings.first.status).to eq "REJECTED"
    end
  end

  describe '.find_by_user' do
    it "finds all the bookings by a user" do
      cat = insert_cat
      user = insert_user
      booking = Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: user.id)
      users_booking = Booking.find_by_user(user_id: user.id)
      expect(users_booking.first.id).to eq booking.id
      expect(users_booking.first.cat_id).to eq cat.id
      expect(users_booking.first.status).to eq 'PENDING'
    end

  end
end
