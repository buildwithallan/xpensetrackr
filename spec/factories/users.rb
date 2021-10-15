FactoryBot.define do
  factory :user do
   email {'admin@admin.com'}
   password {'admin1234'}
   password_confirmation {'admin1234'}
  end
end
