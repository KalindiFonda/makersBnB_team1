class Booking
  def self.create(cat_id:, booking_start:, booking_end:, user_id:)
    result = DatabaseConnection.query("INSERT INTO bookings (cat_id, booking_start, booking_end, user_id)
                        VALUES ('#{cat_id}', '#{booking_start}', '#{booking_end}', #{user_id})
                        RETURNING cat_id, booking_start, booking_end, user_id")
  end
end

# to return booking event
# Cat.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'],
#         picture: result[0]['picture'], price: result[0]['price'])
