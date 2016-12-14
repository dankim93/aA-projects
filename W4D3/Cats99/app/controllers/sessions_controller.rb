class SessionsController < ApplicationController
  before_action :invalid_action


  def new
    render :new
  end

  def create
    user = login_user!(session_params[:username], session_params[:password])
    if user
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    render :new
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
