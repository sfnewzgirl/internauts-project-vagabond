class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])
  end
  def new
    @post = Post.new
    @city = City.find_by_id(params[:id])
  end
end


# t.integer  "user_id"
# t.integer  "city_id"
