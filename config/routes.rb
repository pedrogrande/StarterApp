Rails.application.routes.draw do
  resources :org_profiles
  resources :portfolio_items
  resources :links
  resources :freelancer_profiles
  resources :enquiries
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
  get 'privacy', to: 'pages#privacy'

  devise_for :users, controllers: { registrations: "registrations" }
  root 'home#index'

end
