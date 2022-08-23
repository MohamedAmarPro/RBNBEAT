class InstrumentsController < ApplicationController
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

  def params_instruments
    params.require(:instrument).permit(:name, :category, :brand, :age, :brand, photos: [])
  end
end
