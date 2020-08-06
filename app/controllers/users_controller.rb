class UsersController < ApplicationController

  before_action :authenticate_user! # rails magic => need to authenticate user
  before_action :set_user, only: [:edit, :destroy, :update, :index]

def show

end
# end show method


def index # shows feed: user's post + following's posts
   # initialise
    @posts = Array.new
    following_people = Array.new 

    # get all the relationships where current user is a follower
    connections = Relationship.where(follower_id: current_user.id)

    # we get the current user's posts
    @posts = User.find(current_user.id).posts
    puts "current user: " + current_user.id.to_s
    
    # using the relationship, we get all the people who are currently being followed
    connections.each do |following|
      # we get all the posts of the person being followed
      new_post =  Post.where(user_id: following.followed_id)
      new_post.each do |post|
        puts following.followed_id.to_s
        puts post.caption 
        puts post.user.id
    end 
    # combine with the current user's posts
    @posts = new_post == nil ? @posts : new_post + @posts

    @posts.each do |post|
      puts post.caption
      puts post.user.id
    end 
  end 
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
