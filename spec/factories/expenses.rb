FactoryBot.define do
  factory :expense do
    expense_name { "Uber" }
    category { "Transportion" }
    amount { "19.99" }
  end
end
