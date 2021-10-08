class Income < ApplicationRecord
	validates :monthly_income, presence: :true, numericality: {greater_than_or_equal_to: 10.00}
	validates :income_date, presence: :true

	belongs_to :user
end
