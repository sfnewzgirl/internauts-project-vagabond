class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:post_id])
  end

  def new
      @post = Post.new
      city_id = params[:city_id]
      @city = City.find_by(id: city_id)
    end

  def create
    city = City.find(params[:city_id])
    new_post = Post.new(post_params)
    if new_post.save
      citys.posts << new_post
      redirect_to city_post_path(city, new_post)
    else
      redirect_to new_city_post_path(city)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :content)
  end
end
