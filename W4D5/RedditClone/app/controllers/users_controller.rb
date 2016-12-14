class UsersController < ApplicationController
  before_action :already_logged, only: [:new]
  before_action :require_login, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show
    ### check later
    @user = User.find_by(id: params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def already_logged
    if current_user
      flash[:errors] = ["Log out first to create a new user!"]
      redirect_to user_url(current_user)
    end
  end
end
