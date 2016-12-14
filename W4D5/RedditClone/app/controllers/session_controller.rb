class SessionController < ApplicationController
before_action :require_login, only: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:username],
                                    session_params[:password])

    if user.nil?
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    else
      user.save
      login(user)
      redirect_to user_url(user)
    end

  end

  def destroy
    user = User.find_by(id: params[:id])
    logout(user)
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
