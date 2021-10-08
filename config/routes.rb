Rails.application.routes.draw do

  
  
  devise_for :users, :controllers => {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'main#index', as: :unauthenticated_root
    end

     get '/users/sign_out' => 'devise/sessions#destroy'

  end
  
 
  
  get 'dashboard/index'
  root to: "main#index"

  resources :incomes
  resources :expenses
end
