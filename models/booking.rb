class Booking

  attr_reader :id, :booking_start, :booking_end , :cat_id , :user_id

  def initialize(id: , booking_start: , booking_end: , cat_id: , user_id: )
    @id = id
    @booking_start = booking_start
    @booking_end = booking_end
    @cat_id = cat_id
    @user_id = user_id
  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookings;")
    result.map { |booking| Booking.new(id: booking['id'], booking_start: booking['booking_start'],
       booking_end: booking['booking_end'], cat_id: booking['cat_id'], user_id: booking['user_id'])}
  end

  def self.create(cat_id:, booking_start:, booking_end:, user_id:)
    result = DatabaseConnection.query("INSERT INTO bookings (cat_id, booking_start, booking_end, user_id)
                        VALUES ('#{cat_id}', '#{booking_start}', '#{booking_end}', #{user_id})
                        RETURNING cat_id, booking_start, booking_end, user_id")
  end
end

# to return booking event
# Cat.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'],
#         picture: result[0]['picture'], price: result[0]['price'])
