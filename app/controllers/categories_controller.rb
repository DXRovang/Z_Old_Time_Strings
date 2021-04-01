class CategoriesController < ApplicationController
  before_action(:require_login)
  
  def index 
    if params[:family_id]
      @family = Family.find_by(id: params[:family_id])
      if params[:category]
        @instruments = Instrument.category_search(params[:category][:category_id])
      else
        @instruments = []
      end
    else
      redirect_to families_path
    end
  end

  def show 
    @category = Category.find_by(id: params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :comment, :category_id)
  end
end
