Rails.application.routes.draw do
  
  root to: "main#index"
  
  get 'dashboard/index'
  resources :incomes
  resources :expenses
end
