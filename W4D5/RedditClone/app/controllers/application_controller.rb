class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
    current_user
  end

  def logout(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  private

  def require_login
    unless current_user
      flash[:errors] = ["You must log in first!"]
      redirect_to new_session_url
    end
  end
end
