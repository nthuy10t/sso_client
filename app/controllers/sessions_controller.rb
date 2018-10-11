class SessionsController < ApplicationController
  layout "application"
  
  def create
    @user = User.where(email: auth.info.email, uid: auth.uid).first
    unless @user
      @user = User.new(email: auth.info.email, uid: auth.uid)
    end
    @user.save
    login(@user)
    redirect_to root_path
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to "#{ENV["PROVIDER_URL"]}/users/logout"
  end

  def failure
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end