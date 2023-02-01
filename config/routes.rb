Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root to: 'posts#index'
  resources :posts
end
