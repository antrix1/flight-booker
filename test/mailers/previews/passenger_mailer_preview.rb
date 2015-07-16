# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  def booking_info
    passenger = Passenger.last
    PassengerMailer.booking_info(passenger)
  end

end
