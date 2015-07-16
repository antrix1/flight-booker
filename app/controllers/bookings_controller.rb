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
        @booking.passengers.each do |passenger|
          PassengerMailer.booking_info(passenger).deliver_now
        end
        flash.now[:success] = "Booking successful. You will be redirected to your booking info now."
        format.html {redirect_to root_url}
        format.js { }
      else
        format.js
      end

    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def whitelist_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
