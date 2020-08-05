class UsersController < ApplicationController

  before_action :authenticate_user! # rails magic => need to authenticate user
  before_action :set_user, only: [:edit, :destroy, :update, :index]

  def show
    @followers = Array.new
    @following = Array.new
    
    @user = User.find(params[:id]) # this is the person who is currently being shown
    followers = Relationship.where(followed_id: @user.id) # we find the Relationships where users follow current user
    following = Relationship.where(follower_id: @user.id) # we find the Relationships of users who this current user follows

    # using the id, we find the Users and push them into an array so that the front-end can render
    followers.each do |follower|
      @followers.push(User.find(follower.follower_id)) 
    end 

    following.each do |following|
      @following << User.find(following.followed_id)
    end 
  end


  def index
   @posts = Post.all

  end

def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else
      render :new
    end
end


def edit
end

def update
  # if @user.update(user_params)
  #   redirect_to user_path
  # else
  #   render :edit
  # end

end
private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :desc, :username, :password,:email, :phone, :address, :city, :country)
  end
end
