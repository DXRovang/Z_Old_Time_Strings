class MakersController < ApplicationController
  def index #currently useless
    if params[:search]
      @makers = Maker.all.where("name = ?", params[:search])
      @makers = Maker.all.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  def show #currently useless
    @maker = Maker.find_by(id: params[:id])
  end

end
