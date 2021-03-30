class SessionsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    @user = User.find_by(username: params[:username])
    if @user 
      #&& @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to "/login"
  end

  private

  def user_params
    params.require(:user).permit(
      :username, 
      :email, 
      :password,
      :password_confirmation
    )
  end
end
