class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@tot_income = Income.where(income_date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).sum(:monthly_income)
  	@tot_expense = Expense.where(expense_date: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).sum(:amount)
  	@expenses = Expense.all.last(5)
  	@available_funds = @tot_income - @tot_expense
  end
end
