Rails.application.routes.draw do
  get 'photo/index'
  get 'photo/create'
  get 'photo/new'
  get 'photo/edit'
  get 'photo/update'
  get 'photo/destroy'
  devise_for :views
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bills

  resources :bills_items

  resources :group_bills
  resources :users_bills
  resources :items
  resources :users
  resources :photos

  root to: 'users#index'

end
