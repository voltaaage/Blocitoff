Rails.application.routes.draw do
  get 'users/show'

  get 'user/show'

  devise_for :users
  get 'welcome/index'
  root to: 'welcome#index'
end
