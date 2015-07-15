class Airport < ActiveRecord::Base
  has_many :departed_flights, class_name: Flight, foreign_key: :departure_airport_id
  has_many :arriving_flights, class_name: Flight, foreign_key: :destionation_airport_id
end
