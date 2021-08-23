FactoryBot.define do
  factory :expense do
    expense_name { "Uber" }
    category { "Transportion" }
    amount { 10.00 }
  end
end
