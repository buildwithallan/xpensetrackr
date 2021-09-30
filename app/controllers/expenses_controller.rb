class ExpensesController < ApplicationController
 before_action :authenticate_user!
 before_action :set_expense, only: [:edit, :update, :destroy]

  def index
  	@expenses = Expense.all
  end

  def new
  	@expense = Expense.new
  end

  def create
  	@expense = Expense.new(expense_params)
    @expense.user = current_user
    
  	if @expense.save
  		redirect_to expenses_path, notice: "Expense created"
  	else
      render :new, status: :unprocessable_entity	
  	end
  end

  def edit 
  end

  def update
  	if @expense.update(expense_params)
  		redirect_to expenses_path, notice: "Expense Updated"
  	else
  		render :edit, status: :unprocessable_entity		
  	end	
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path
  end

  private

  def set_expense
  	@expense = Expense.find(params[:id])
  end

  def expense_params
  	params.require(:expense).permit(:expense_date, :expense_name, :category, :amount)
  end
end
