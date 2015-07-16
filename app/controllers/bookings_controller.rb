class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_selected])
    @booking = Booking.new
    params[:passenger_count].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @booking = Booking.new(whitelist_params)
    if @booking.save
      redirect_to root_url
    else
      render :back
    end

  end

  private

  def whitelist_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
