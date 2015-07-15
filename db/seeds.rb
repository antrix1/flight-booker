# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airports = {:NYC => "New York",
           :SFO => "San Francisco",
           :LON => "London",
           :LPL => "Liverpool",
           :BEG => "Belgrade",
           :BER => "Berlin",
           :ZRH => "Zurich"
}

airports.each do |k, v|
    Airport.create(code: k, city: v)
end

all_airports = Airport.all

all_airports.each_with_index do |airport, index|
  Flight.create(date: rand(20.days).seconds.from_now,
                departure_airport_id: airport.id,
                destination_airport_id: all_airports[index+1].id,
                price: rand(200..1000)) if index < all_airports.length - 1
end



all_airports.to_a.reverse!.each_with_index do |airport, index|
Flight.create(date: rand(20.days).seconds.from_now,
              departure_airport_id: airport.id,
              destination_airport_id: all_airports[index+1].id,
              price: rand(200..1000)) if index < all_airports.length - 1
  end