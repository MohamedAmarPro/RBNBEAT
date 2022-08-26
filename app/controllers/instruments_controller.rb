class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %I[index show]
  before_action :set_instrument, only: %I[show destroy edit update]

  def index

    @pagy, @instruments = pagy(Instrument.all, items: 3)

    @markers = @instruments.geocoded.map do |instrument|
      {
        lat: instrument.latitude,
        lng: instrument.longitude,
        info_window: render_to_string(partial: "info_window", locals: {instrument: instrument}),
        image_url: helpers.asset_url("note")
      }
    end

  end

  def show
    @markers = [{lat: @instrument.latitude, lng: @instrument.longitude, image_url: helpers.asset_url("note")}]
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(params_instruments)
    @instrument.user = current_user
    if @instrument.save
      redirect_to instruments_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path
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
    params.require(:instrument).permit(:name, :category, :brand, :age, :price, photos: [])
  end
end
