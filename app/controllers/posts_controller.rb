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
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)
    if current_user
      @post = Post.create(post_params)
      if @post.save
        redirect_to city_path
      else
        render 'new'
      end

    #  @post.user = current_user
    #  post = post_params.merge({author: current_user.name})
    else
     flash[:create_post_error] = "Please log in."
     redirect_to login_path
    end

# author: current_user.name,

  end

  def edit
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    city_id = params[:city_id]
    @city = City.find_by(id: city_id)

    unless current_user == @post.user
      if current_user
        redirect_to user_path(current_user.id)
      else
        redirect_to login_path
      end
    end
  end

  def update
    post_id = params[:id]
    post = Post.find_by(id: post_id)
    city_id = params[:city_id]
    # city = City.find_by(id: city_id)
    post.update(post_params)
    redirect_to city_path(city_id)
  end

  def destroy
    post_id = params[:id]
    @post = Post.find_by(id: post_id)
    @user = User.find_by(id: @post.user_id)
    city_id = @post.city_id
    @post.delete
    redirect_to user_path(@user)
    # user_id = current_user.id
    # user = User.find_by(id: user_id)

  end

  private
  def post_params
    post_info = params.require(:post).permit(:title, :content)
    post_info.merge({city_id: params[:city_id], user_id: current_user.id, author: current_user.name})
  end
end
