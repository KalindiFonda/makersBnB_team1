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

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookings;")
    result.map { |booking| create_booking_instance(booking) }
  end

  def self.create(cat_id:, booking_start:, booking_end:, user_id:)
    result = DatabaseConnection.query("INSERT INTO bookings (cat_id, booking_start, booking_end, user_id, status)
                        VALUES ('#{cat_id}', '#{booking_start}', '#{booking_end}', #{user_id}, 'PENDING')
                        RETURNING id, cat_id, booking_start, booking_end, user_id, status")
    create_booking_instance(result[0])
  end

  def self.change_status(id: , status:)
    result = DatabaseConnection.query("UPDATE bookings SET status = '#{status}' WHERE id = '#{id}' RETURNING id, cat_id, booking_start, booking_end, user_id, status")
    create_booking_instance(result[0])
  end

  def self.find_by_user(user_id: )
    result = DatabaseConnection.query("SELECT *
          FROM bookings JOIN cats ON (cat_id=cats.id) WHERE bookings.user_id = #{user_id}")
    result.map { |booking| booking}
  end

  private

  def self.create_booking_instance(params)
    new(id: params['id'], booking_start: params['booking_start'],
        booking_end: params['booking_end'], cat_id: params['cat_id'],
        user_id: params['user_id'], status: params['status'])
  end


end
