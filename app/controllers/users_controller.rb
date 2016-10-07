class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user.id)
    else
      flash[:sign_up_error] = "Something went wrong, please try again"
      redirect_to new_user_path
    end
  end
  def edit
  end
  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :current_city, :join_date, :email, :password)
  end
end
