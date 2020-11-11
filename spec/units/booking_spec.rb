describe Booking do
  describe '.create' do
    it " adds an entry to the booking table" do
      cat = Cat.create(name: 'Prongs', description: 'The cutest kitten', picture: "https://placekitten.com/g/600/300", price: 500)
      Booking.create(cat_id: cat.id, booking_start: "2020-11-20", booking_end: "2020-11-28", user_id: "4")
      all_bookings = Booking.all
      expect(all_bookings.first.cat_id).to eq cat.id
    end
  end
end
