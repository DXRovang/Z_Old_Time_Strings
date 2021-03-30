class CategoriesController < ApplicationController
  before_action(:require_login)
  
  def index #I think this is only being used by the Family Controller
    if params[:family_id]
      @family = Family.find_by(id: params[:family_id])
      if params[:category]
        @instruments = Instrument.where('category_id = ?', params[:category][:category_id])
      else
        @instruments = []
      end
    else
      redirect_to families_path #something better here?
    end
  end

  def show #is this necessary?
    @category = Category.find_by(id: params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :comment, :category_id)
  end
end
