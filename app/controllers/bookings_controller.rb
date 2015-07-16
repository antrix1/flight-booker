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
    respond_to do |format|
      if @booking.save

        format.html {redirect_to root_url}
        format.js {render js: %(window.location.href='#{booking_path @booking}'); flash[:success] = "Booking successful" }
      else
        format.js
      end

    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def whitelist_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
