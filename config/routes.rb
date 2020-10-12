Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :items do
    resources :purchases, only:[:index, :create]
  end
  get 'items', to: 'items#fee'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
