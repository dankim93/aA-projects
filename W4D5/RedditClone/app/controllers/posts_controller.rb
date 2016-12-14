class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save

      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end

  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update

    @post = Post.find_by(id: params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = ["Post was not updated"]
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author_id, :url, :content, sub_ids: [])
  end

end
