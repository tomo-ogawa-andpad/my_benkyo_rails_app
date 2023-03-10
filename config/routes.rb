Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    get '/users/summary_download', to: 'users#summary_download'
    resources :users
    resources :userpage, only: %i[show]
  end
  root to: 'posts#index'
  resources :posts
  get '/mypage', to: 'mypage#show'
end
