Rails.application.routes.draw do
  devise_for :views
  get 'bill/index'
  get 'bill/show'
  get 'bill/edit'
  get 'bill/delete'
  get 'bill/create'
  get 'bill/update'
  get 'item/index'
  get 'item/show'
  get 'item/edit'
  get 'item/delete'
  get 'item/create'
  get 'item/update'
  get 'guests_bill/index'
  get 'guests_bill/show'
  get 'guests_bill/edit'
  get 'guests_bill/delete'
  get 'guests_bill/create'
  get 'guests_bill/update'
  get 'guest/index'
  get 'guest/show'
  get 'guest/edit'
  get 'guest/delete'
  get 'guest/create'
  get 'guest/update'
  get 'group_bill/index'
  get 'group_bill/show'
  get 'group_bill/edit'
  get 'group_bill/delete'
  get 'group_bill/create'
  get 'group_bill/update'
  get 'bills_item/index'
  get 'bills_item/show'
  get 'bills_item/edit'
  get 'bills_item/delete'
  get 'bills_item/create'
  get 'bills_item/update'
  get 'bills/index'
  get 'bills/show'
  get 'bills/edit'
  get 'bills/deletecreate'
  get 'bills/update'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bill
  resources :bill_item
  resources :group_bill
  resources :guest
  resources :guests_bill
  resources :item

  root to: 'guest#index'

end
