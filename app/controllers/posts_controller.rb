class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:post_id])
    @city = City.find_by(id: @post.city_id)

    @user = User.find_by(id: @post.user_id)

  end

  def new
    @post = Post.new
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)
  end

  def create
     @post = Post.create(post_params)
     @post.user = current_user
     redirect_to city_path
  end

  def edit
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)
  end

  def update
    post_id = params[:id]
    post = Post.find_by(id: post_id)
    city_id = params[:city_id]
    city = City.find_by(id: city_id)
    post.update_attributes(post_params)
    redirect_to city_path
  end

  private
  def post_params
    post_info = params.require(:post).permit(:title, :content)
    post_params = post_info.merge({author: current_user.name, city_id: params[:city_id], user_id: current_user.id})
  end
end
