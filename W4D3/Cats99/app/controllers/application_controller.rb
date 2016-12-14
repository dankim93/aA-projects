class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def login_user!(username, password)
    user = User.find_by_credentials(username, password)
    session[:session_token] = user.reset_session_token! unless user.nil?
    user
  end

  def invalid_action
    if params[:action] == "new" && current_user
      redirect_to cats_url
    end
  end
end
