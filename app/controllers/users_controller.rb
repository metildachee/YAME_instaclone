class UsersController < ApplicationController

  before_action :authenticate_user! # rails magic => need to authenticate user
  before_action :set_user, only: [:edit, :destroy, :update, :index]

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
