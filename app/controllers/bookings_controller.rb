class BookingsController < ApplicationController
  before_action :set_bookings, only: %I[edit update]

  def index
    @bookings = Booking.all
  end

  def new
    set_instrument
    @booking = Booking.new
  end

  def create
    set_instrument
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    require.params(:bookings).permit(:rent_start_date, :rent_end_date, :status)
  end

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end
end
