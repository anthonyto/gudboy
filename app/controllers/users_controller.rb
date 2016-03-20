class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def show
    @user
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :budget)
    end
end
