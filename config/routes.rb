Rails.application.routes.draw do
  get 'items/create'

  devise_for :users
  resources :users, only: [:show] do
    resources :items, only: [:index, :create, :show, :destroy]
  end
  

  root to: 'welcome#index'
end
