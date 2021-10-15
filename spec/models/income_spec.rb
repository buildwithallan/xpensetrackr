require 'rails_helper'

RSpec.describe Income, type: :model do
  
  describe "validations" do
  	it {is_expected.to validate_presence_of :monthly_income}
  	it {is_expected.to validate_numericality_of(:monthly_income).is_greater_than_or_equal_to(10.00)}
  end

  describe "association" do
  	it {is_expected.to belong_to(:user)}
  end
end
