class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @airports = Airport.all.map { |airport| [airport.city, airport.id] }
    @dates = Flight.order("date asc").all.map { |flight| [flight.date.strftime("%d/%m/%Y")] }.uniq
    @passengers = [1, 2, 3, 4]


    if !params[:flight].nil?
      @from = params[:flight][:from_airport]
      @to = params[:flight][:to_airport]
      @date = params[:flight][:date]
      @passengers_select = params[:flight][:passengers]
      @flights = Flight.search(@from, @to, @date)

      respond_to do |format|
        format.html
        format.js
      end
    end

  end
end
