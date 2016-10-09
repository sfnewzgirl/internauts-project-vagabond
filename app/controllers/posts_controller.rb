class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:post_id])
  end

  def new
    @post = Post.new
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)
  end
  # def create
  #   city = City.find(params[:city_id])
  #   new_post = Post.new(post_params)
  #   if new_post.save
  #     city.posts << new_post
  #     redirect_to post_path
  #   else
  #     redirect_to root_path
  #   end


  def create
    city = City.find_by_id(params[:id])
    debugger
    new_post = Post.new(post_params)
    if new_post.save
      city.posts << new_post
      flash [:notice]
      redirect_to city_path
    else
      redirect_to post_path
    end
  end

    #save user_id
    #save city_id
    #need to turn author into logged in user
  # end

  private
  def post_params
    params.require(:post).permit(:title, :author, :content)
  end
end
