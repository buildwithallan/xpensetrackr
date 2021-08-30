class IncomesController < ApplicationController
  def index
  	@incomes = Income.all
  end

  def new
  	@income = Income.new
  end

  def create
  	@income = Income.new(income_params)

  	if @income.save
  	  redirect_to incomes_path
  	else
  		render :new, status: :unprocessable_entity
  	end
  end

  private

  def income_params
  	params.require(:income).permit(:monthly_income)
  end
end
