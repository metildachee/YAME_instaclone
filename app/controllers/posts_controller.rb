class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    puts params[:caption]
    puts params[:main_image]
    @post = Post.new(post_params)
    @post["user_id"] = current_user.id
    if @post.save
      redirect_to posts_index_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def destory
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:caption, :main_image, :user_id)
  end
end
