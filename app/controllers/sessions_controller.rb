class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == "" || params[:password] == "" || params[:confirm_password] == ""
      @error = "You must fill in all fields correctly"
      render :new
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to families_path
      else
        render :new
      end
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
