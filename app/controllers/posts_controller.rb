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
  end

  def show
    @post = Post.find(params[:id])
<<<<<<< HEAD
    @comments = Comment.all
=======
    @comments = @post.comments

>>>>>>> d8568955d278a1393a24326544924fa35f2ee1d5
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

