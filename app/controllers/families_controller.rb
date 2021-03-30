class FamiliesController < ApplicationController
  before_action(:require_login)
  
  def index
    @families = Family.all
  end

  def show #is this necessary?
    @family = Family.find_by(id: params[:id])
  end
end
