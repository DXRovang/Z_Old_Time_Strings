class InstrumentsController < ApplicationController
before_action(:require_login)

  def index
    @instruments = Instrument.all
  end

  def new
    @instrument = Instrument.new 
    @family = Family.find_by(id: params[:family][:id])
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user_id = current_user.id
    if @instrument.save 
      redirect_to instrument_path(@instrument)
    else
      #nightmare
      if (1..4).to_a.include?(instrument_params[:category_id].to_i)
        @family = Family.find_by(id: 1)
      elsif (8..15).to_a.include?(instrument_params[:category_id].to_i)
        @family = Family.find_by(id: 2)
      elsif (5..7).to_a.include?(instrument_params[:category_id].to_i)
        @family = Family.find_by(id: 3)
      end
      render :new
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def edit
    @instrument = Instrument.find(params[:id])
    if @instrument.user_id != current_user.id
      redirect_to instruments_path
    else
      if (1..4).to_a.include?(@instrument.category_id.to_i)
        @family = Family.find_by(id: 1)
      elsif (8..15).to_a.include?(@instrument.category_id.to_i)
        @family = Family.find_by(id: 2)
      elsif (5..7).to_a.include?(@instrument.category_id.to_i)
        @family = Family.find_by(id: 3)
      end
    end
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  def destroy
    @instrument = Instrument.find_by(id: params[:id])
    if @instrument.user_id != current_user.id
      redirect_to instruments_path
    else
      @instrument.destroy
      redirect_to instruments_path
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(
      :price, 
      :year, 
      :frets, 
      :color, 
      :material, 
      :sound_hole, 
      :body, 
      :neck, 
      :back, 
      :bridge, 
      :description,  
      :for_sale,
      :category_id,
      :maker_name,
    )
  end
end
