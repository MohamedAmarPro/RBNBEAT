class InstrumentsController < ApplicationController
  before_action :set_instrument, only: :show

  def index
    @instruments = Instrument.all
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(params_instruments)
    if @instrument.save
      redirect_to instruments_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def params_instruments
    params.require(:instrument).permit(:name, :category, :brand, :age, :brand, photos: [])
  end
end
