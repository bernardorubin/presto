Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :user
  get 'requisition/index'
  get 'home/index'
  root to:'home#index'
  resources :requisitions
  get 'profile' => 'profile#index'
  patch 'profile' => 'profile#update'
end
