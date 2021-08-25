class ExpensesController < ApplicationController
 before_action :set_expense, only: [:edit, :update, :destroy]

  def index
  	@expenses = Expense.all
  end

  def new
  	@expense = Expense.new
  end

  def create
  	@expense = Expense.new(expense_params)
    
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
  		redirect_to expenses_path
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
  	params.require(:expense).permit(:expense_name, :category, :amount)
  end
end
