class InstrumentsController < ApplicationController
before_action(:require_login)
before_action :set_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @instruments = Instrument.all
  end

  def new 
    # binding.pry
    #linked from the families index page & routed through nested users
    @instrument = Instrument.new 
    @family = Family.find_by(id: params[:family][:id])
  end

  def create
    # binding.pry
    @instrument = Instrument.new(instrument_params)
    @instrument.user_id = current_user.id
    # binding.pry
    if @instrument.save 
      redirect_to instrument_path(@instrument)
    else
      #this is a nightmare, fixed with new schema
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
    # set_instrument
  end

  def edit
    # set_instrument
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
    # set_instrument
    @instrument.update(instrument_params)
    redirect_to instrument_path(@instrument)
  end

  def destroy
    # set_instrument
    if @instrument.user_id != current_user.id
      redirect_to instruments_path
    else
      @instrument.destroy
      redirect_to instruments_path
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find_by(id: params[:id])
  end

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
