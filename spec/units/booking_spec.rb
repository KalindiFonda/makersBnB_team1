describe Booking do

  describe '.all' do
    it "shows all the events" do
      cat = insert_cat
      Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: "4")
      all_bookings = Booking.all
      expect(all_bookings.length).to eq 1
      expect(all_bookings.first.cat_id).to eq cat.id
    end
  end

  describe '.create' do
    it " adds an entry to the booking table" do
      cat = Cat.create(name: 'Prongs', description: 'The cutest kitten', picture: "https://placekitten.com/g/600/300", price: 500)
      Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: "4")
      all_bookings = Booking.all
      expect(all_bookings.first.cat_id).to eq cat.id
    end
  end

  describe '.change_status' do
    it "changes the status to CONFIRMED" do
      cat = insert_cat
      booking = Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: "4")
      Booking.change_status(id: booking.id, status: "CONFIRMED")
      all_bookings = Booking.all
      expect(all_bookings.first.status).to eq "CONFIRMED"
    end
  end
end
