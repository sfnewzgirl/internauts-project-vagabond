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
  #   city = City.find_by_id(params[:city_id])
  #   debugger
  #   new_post = Post.new(post_params)
  #   if new_post.save
  #     city.posts << new_post
  #     redirect_to post_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  #mimics pet app
  # def create
  #   city = City.find(params[:city_id])
  #   new_post = Post.new(post_params)
  #   if new_post.save
  #     city.pets << new_post
  #     redirect_to new_post_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  def create
    @city = City.find(params[:city_id])
    @post = @city.posts.build(params[:post])

    # This is unnecessary as you're already adding
    # the post to the topic with the build statement.
    # @post.topic  = @topic

    if @post.save
        flash[:success] = "Konu oluşturuldu!"
        redirect_to post_path
    else
        redirect_to root_path
    end
  end


  #
  # def create
  #   city_id = params[:city_id]
  #   @city = City.find_by(id: city_id)
  #   # @city = City.find_by_id(params[:city_id])
  #   new_post = Post.new(post_params)
  #   if new_post.save
  #     @city.posts << new_post
  #     redirect_to city_path
  #   else
  #     redirect_to post_path
  #   end
  # end

    #save user_id
    #save city_id
    #need to turn author into logged in user
  # end

  private
  def post_params
    params.require(:post).permit(:title, :author, :content, :city_id)
  end
end
