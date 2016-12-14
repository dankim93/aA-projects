class CatRentalRequestsController < ApplicationController
  before_action :valid_owner

  def valid_owner
    cat = Cat.find_by(id: params[:id])
    if (params[:action] == "approve" || params[:action] == "deny") && (current_user != current_cat.owner)
      redirect_to cats_url
    end
  end

  def approve
    current_cat_rental_request.approve!
    redirect_to cat_url(current_cat)
  end

  def create
    create_params = cat_rental_request_params
    create_params[:user_id] = current_user.id
    @rental_request = CatRentalRequest.new(create_params)
    if @rental_request.save
      redirect_to cat_url(@rental_request.cat)
    else
      flash.now[:errors] = @rental_request.errors.full_messages
      render :new
    end
  end

  def deny
    current_cat_rental_request.deny!
    redirect_to cat_url(current_cat)
  end

  def new
    @rental_request = CatRentalRequest.new
  end

  private
  def current_cat_rental_request
    @rental_request ||=
      CatRentalRequest.includes(:cat).find(params[:id])
  end

  def current_cat
    current_cat_rental_request.cat
  end

  def cat_rental_request_params
    params.require(:cat_rental_request)
      .permit(:cat_id, :end_date, :start_date, :status)
  end
end
