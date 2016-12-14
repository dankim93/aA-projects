class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user.nil?
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    current_user.reset_session_token!

    redirect_to new_session_url
  end

  def new
    render :new
  end


  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
