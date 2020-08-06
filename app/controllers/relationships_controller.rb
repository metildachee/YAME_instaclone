class RelationshipsController < ApplicationController
  def create
    # Current user follows another person
    if Relationship.new({ followed_id: params[:user_id], follower_id: current_user.id }).save
      redirect_to user_path(params[:user_id])
    else 
      redirect_to user_path(params[:user_id])
    end 
  end

  def destroy
    # current user unfollows someone
    if Relationship.find_by(followed_id: params[:user_id], follower_id: current_user.id).delete
      redirect_to user_path(params[:user_id])
    else 
      redirect_to user_path(params[:user_id])
    end 
  
  end
end
