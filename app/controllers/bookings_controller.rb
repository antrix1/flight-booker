class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_selected])
  end
end
