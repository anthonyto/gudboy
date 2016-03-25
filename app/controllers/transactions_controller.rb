class TransactionsController < ApplicationController
  before_action :set_category
  before_action :set_transaction, except: [:index, :create]
  
  def index 
    @transactions = @category.transactions
  end
  
  def show
  end
  
  def create 
    @transaction = Transaction.new(transaction_params)
    # There has to be a way to refactor this
    @transaction.category = @category
    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @transaction.update(transaction_params)
      render json: @transaction, status: :ok
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
  end
  
  private
  
  def transaction_params
    params.require(:transaction).permit(:amount, :category_id, :date)
  end
  
  def set_category
    @category = Category.find(params[:category_id])
  end
  
  def set_transaction
    # This will fail if the transaction does not exist
    # find_by is an option
    @transaction = @category.transactions.find(params[:id])
  end
end