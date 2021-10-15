FactoryBot.define do
  factory :expense do
    expense_name { "Uber" }
    category { "Transportion" }
    amount { 10.00 }
    expense_date {"10/01/2021"}
    user_id {1}
  end
end
