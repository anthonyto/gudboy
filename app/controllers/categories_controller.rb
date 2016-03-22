class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update]
  
  def index
    @categories = @user.categories
  end
  
  def show
  end
  
  def create
    @category = Category.new(category_params)
    @category.set_user_id(@decoded_auth_token)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
    
    def set_category
      @category = @user.categories.where(params[:id])
    end
end