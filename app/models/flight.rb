class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: Airport, foreign_key: :departure_airport_id
  belongs_to :to_airport, class_name: Airport, foreign_key: :destination_airport_id

  has_many :bookings
  has_many :passengers, through: :passenger_bookings
end
