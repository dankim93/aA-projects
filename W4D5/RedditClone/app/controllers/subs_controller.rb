class SubsController < ApplicationController

  def new
    @sub = Sub.new
    render :new
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def create
    sub = Sub.new(sub_params)
    sub.moderator_id = current_user.id

    if sub.save
      redirect_to sub_url(sub)
    else
      flash[:errors] = sub.errors.full_messages
      redirect_to new_sub_url
    end

  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    sub = Sub.find(id: params[:id])

    if sub.update(sub_params)
      redirect_to sub_url(sub)
    else
      flash.now[:errors] = "Sub was not updated"
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

end
