class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end 

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if params[:id].to_i != session[:user_id]
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if params[:id].to_i != session[:user_id]
      redirect_to user_path(@user)
    end
    @user.instruments.each do |i|
      i.destroy
    end
    @user.destroy
    redirect_to signup_path
  end

  private


  def user_params
    params.require(:user).permit(
      :username, 
      :email, 
      :password, 
      :password_confirmation)
  end
end
