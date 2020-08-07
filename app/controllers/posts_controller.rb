class PostsController < ApplicationController

def index # all around the world
    @posts = Post.all
    @relationships = Relationship.all
end

def create # this creates a new post
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
    # we get the current post
    post = Post.find(params[:id])

    # delete all the comments with reference to current post
    Comment.where(post_id: post.id).each do |comment|
      Comment.destroy(comment.id).destroy 
    end 

    # we delete the current post
    if Post.destroy(post.id)
      redirect_to users_path
    else
      render :index
    end
  end

  def update
    if Post.find(params[:id]).update(post_params)
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

