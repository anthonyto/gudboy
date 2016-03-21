class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update]
  
  def index
    @user.categories
  end
  
  def show
  end
  
  def create
    # TODO refactor this
    category_params[:user_id] = @user.id
    @category = Category.new(category_params)
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
      @category = @@user.categories.where(params[:id])
    end
end