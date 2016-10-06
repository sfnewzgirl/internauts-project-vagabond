class UsersController < ApplicationController
  def show
    @user = User.find_by_id[:id]
  end
  def new
    @user = User.new
  end
  def create
    user = User.new(user_params)
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
