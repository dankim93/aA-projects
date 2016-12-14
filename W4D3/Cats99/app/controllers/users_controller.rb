class UsersController < ApplicationController
  before_action :invalid_action

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login_user!(user_params[:username], user_params[:password])
      redirect_to cats_url
    else
      render :new
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
