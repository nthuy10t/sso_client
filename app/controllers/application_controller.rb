class ApplicationController < ActionController::Base
  def require_logged_in
    unless current_user
      redirect_to "/auth/sso"
    end
  end

  def login user
    session[:user_id] = user.uid
  end

  def current_user
    @user = User.find_by(uid: session[:user_id]) if session[:user_id]
  end
end
