class MakersController < ApplicationController
  def index
    if params[:search]
      @makers = Maker.search(params[:search])
    end
  end

  def show
    @maker = Maker.find_by(id: params[:id])
  end

end
