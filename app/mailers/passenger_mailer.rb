class PassengerMailer < ApplicationMailer

  def booking_info(passenger)
    @passenger = passenger

    mail to: @passenger.email, subject: "Booking Info for flight #{@passenger.flights.last.from_airport.city} - #{@passenger.flights.last.to_airport.city}"
  end

end
