class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]
  before_action :set_instrument, only: %I[show destroy edit update]

  def index
    if params[:query].present?
      @instruments = Instrument.search_by_name(params[:query])
    else
      @instruments = Instrument.all
    end

    @pagy, @instruments = pagy(@instruments, items: 4)

    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude,

        info_window: render_to_string(partial: "info_window", locals: {instrument: instrument}),
        image_url: helpers.asset_url("note.jpg")
      }
    end

  end

  def show
    @markers = [{lat: @instrument.latitude, lng: @instrument.longitude, image_url: helpers.asset_url("note.jpg")}]

    @booking = Booking.new

  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(params_instruments)
    @instrument.user = current_user

    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path, status: :see_other
  end

  def edit
  end

  def update
    @instrument.update(params_instruments)
    redirect_to instruments_path
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def params_instruments
    params.require(:instrument).permit(:name, :category, :brand, :age, :price, :address, photos: [])
  end
end
