Rails.application.routes.draw do
  #get 'items/complete/:id' => 'complete#item', as: :complete
  

  devise_for :users
  resources :users, only: [:show] do
    resources :items, only: [:index, :create, :show, :destroy]
  end

  resources :items, only: [] do
    put 'complete'
  end

  
  

  root to: 'welcome#index'
end
