class IncomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_income, only: [:edit, :update, :destroy]
  
  def index
  	@incomes = Income.all
  end

  def new
  	@income = Income.new
  end

  def create
  	@income = Income.new(income_params)
    @income.user = current_user

  	if @income.save
  	  redirect_to incomes_path, notice: "Income created successfully"
  	else
  		render :new
  	end
  end


  def edit   
  end

  def update
    if @income.update(income_params)
      redirect_to incomes_path, notice: "Income Updated"
    else
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to incomes_path
  end

  private

  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
  	params.require(:income).permit(:income_date, :monthly_income)
  end
end
