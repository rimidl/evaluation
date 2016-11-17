Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :directories do
    resources :items, only: [:new, :show, :create, :update, :destroy]
  end

end
