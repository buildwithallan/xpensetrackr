class Expense < ApplicationRecord
	validates_presence_of :expense_date, :expense_name, :category, :amount
	validates :amount, numericality: true
end
