require 'rails_helper'

RSpec.describe Expense, type: :model do
	
  describe "validations" do
  	it {is_expected.to validate_presence_of :expense_name}
  	it {is_expected.to validate_presence_of :category}
  	it {is_expected.to validate_presence_of :amount}
  	it {is_expected.to validate_numericality_of :amount}
  end

  describe "association" do
  	it {is_expected.to belong_to(:user)}
  end
end
