Rails.application.routes.draw do
  devise_for :views
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bills

  resources :bills_items

  resources :group_bills
  resources :guests
  resources :guests_bills
  resources :items

  root to: 'guests#index'

end
