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
    if Comment.find(params[:id]).destroy
      redirect_to post_path(params[:post_id])
    else
      render :index
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
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
