Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
    resources :userpage, only: %i[show]
    resources :users_summaries, only: %i[index create]
  end
  root to: 'posts#index'
  resources :posts
  get '/mypage', to: 'mypage#show'
end
