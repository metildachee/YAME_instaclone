class PostsController < ApplicationController

def index # all around the world
    @posts = Post.all
    @relationships = Relationship.all
end

def create # this creates a new post
    @user = current_user
    @post = @user.posts.build(post_params)
    # if @post.hashtags.build(name: extract_name_hash_tags).save
    if @post.save
      # hashtag = Array.new
      # extract_name_hash_tags.each do |tag|
      #   hashtag << Hashtag.create(name: extract_name_hash_tags[0])
      # end 
      hashtag = Hashtag.create(name: extract_name_hash_tags[0])
      Posthashtag.create(post: @post)
      flash[:success]= "your post has been created!"
      redirect_to users_path
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
    if @post.update(post_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :main_image, :user_id)
  end

  def extract_name_hash_tags
    @post.caption.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

end

