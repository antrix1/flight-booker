class PassengerBooking < ActiveRecord::Base
  belongs_to :passenger
  belongs_to :booking
end
