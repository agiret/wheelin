class BookingsController < ApplicationController
  def new
    @wheely = Wheely.find(params[:wheely_id])
    authorize(@wheely)
    @booking = @wheely.bookings.new
  end

  def create
    @wheely = Wheely.find(params[:wheely_id])
    authorize(@wheely)
    @booking = @wheely.bookings.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to wheely_path(@wheely)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :wheely_id, :user_id)
  end
end
