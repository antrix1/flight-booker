class Flight < ActiveRecord::Base

  belongs_to :from_airport, class_name: Airport, foreign_key: :departure_airport_id
  belongs_to :to_airport, class_name: Airport, foreign_key: :destination_airport_id

  has_many :bookings
  has_many :passenger_bookings, through: :bookings
  has_many :passengers, through: :bookings


  def self.search(from, to, date)
    where(departure_airport_id: from, destination_airport_id: to, date: Flight.format_date(date))
  end

  def self.format_date(date)
    date = date.to_date
    date.beginning_of_day..date.end_of_day
  end

end

