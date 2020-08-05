class UsersController < ApplicationController
  before_action :authenticate_user! # rails magic => need to authenticate user

  def index
  end
end
