class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy]

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment["post_id"] = params[:post_id]
    @comment["user_id"] = current_user.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    if @comment.destroy
      redirect_to posts_path
    else
      render :index
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description, :user_id, :post_id)
  end

end
