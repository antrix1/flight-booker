class Passenger < ActiveRecord::Base
  has_many :passenger_bookings
  has_many :bookings, through: :passenger_bookings
  has_many :flights, through: :bookings

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
end
