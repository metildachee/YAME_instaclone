class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post["user_id"] = current_user.id
    if @post.save
      redirect_to users_path
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
    @post = Post.find(params[:id])
    # we need to change this later for just that one specify comment
    @comments = Comment.all 
    @comment = Comment.new
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
