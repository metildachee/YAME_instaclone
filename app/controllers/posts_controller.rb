class PostsController < ApplicationController
  def index
    @posts = Post.all
    puts @posts
  end

  def create
    @user = current_user

    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success]="your post has been created!"
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

