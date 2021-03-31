class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to families_path
    elsif @user
      @errors = ["Invalid Password"]
      render :new
    else
      @errors = ["Invalid Username"]
      render :new
    end
  end

  def create_with_fb
    user = User.find_or_create_by(username: self.request.env['ominauth.auth']['info']['email']) do |u| 
      u.password = 'password'
    end
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
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
