class PostsController < ApplicationController

def index # all around the world
    @posts = Post.all
    puts @posts
end

def create
    @user = current_user

    @post = @user.posts.build(post_params)
    if @post.save
      flash[:success]="your post has been created!"
      redirect_to users_path
    # @post = Post.new(post_params)
    # @post["user_id"] = current_user.id

    # if @post.save
      # redirect_to posts_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments

    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])

      if @post.destroy
        redirect_to users_path
      else
        render :index
      end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :main_image, :user_id)
  end
end

