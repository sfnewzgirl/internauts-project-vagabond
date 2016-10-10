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
     @post = Post.create(post_params)
     redirect_to city_path
  end

  # def create
  #   user = session[:user_ id]
  #   city = City.find(params[:city_id])
  #   puts "got a city"
  #   new_post = Post.new(post_params)
  #   puts "new_post.title = " + new_post.title
  #   if new_post.save
  #     city.posts << new_post
  #     user.posts << new_post
  #     redirect_to city_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  private
  def post_params
    post_info = params.require(:post).permit(:title, :author, :content)
    post_params = post_info.merge({city_id: params[:city_id], user_id: current_user.id})
  end
end
