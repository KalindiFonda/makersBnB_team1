class Booking

  attr_reader :id, :booking_start, :booking_end , :cat_id , :user_id , :status

  def initialize(id: , booking_start: , booking_end: , cat_id: , user_id: , status: "PENDING")
    @id = id
    @booking_start = booking_start
    @booking_end = booking_end
    @cat_id = cat_id
    @user_id = user_id
    @status = status
  end

  def start_time
    @booking_start
  end


  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookings;")
    result.map { |booking| Booking.new(id: booking['id'], booking_start: booking['booking_start'],
       booking_end: booking['booking_end'], cat_id: booking['cat_id'], user_id: booking['user_id'], status: booking['status'])}
  end

  def self.create(cat_id:, booking_start:, booking_end:, user_id:)
    result = DatabaseConnection.query("INSERT INTO bookings (cat_id, booking_start, booking_end, user_id)
                        VALUES ('#{cat_id}', '#{booking_start}', '#{booking_end}', #{user_id})
                        RETURNING id, cat_id, booking_start, booking_end, user_id, status")
    Booking.new(id: result[0]['id'], booking_start: result[0]['booking_start'],
                booking_end: result[0]['booking_end'], cat_id: result[0]['cat_id'],
                user_id: result[0]['user_id'], status: result[0]['status'])
  end

  def self.change_status(id: , status: )
    result = DatabaseConnection.query("UPDATE bookings SET status = '#{status}' WHERE id = '#{id}' RETURNING id, cat_id, booking_start, booking_end, user_id, status")
    Booking.new(id: result[0]['id'], booking_start: result[0]['booking_start'],
                booking_end: result[0]['booking_end'], cat_id: result[0]['cat_id'],
                user_id: result[0]['user_id'], status: result[0]['status'])
  end

end
