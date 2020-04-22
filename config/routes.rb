Rails.application.routes.draw do
  get 'wines/new'
  get 'sessions/new'
  root 'users#top'
  get '/signup', to: 'users#new'

  mount Base::API => '/'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # snsでログイン
  get 'auth/:provider/callback', to: 'sessions#sns_login',    as: :auth_callback
  get '/auth/failure',         to: 'sessions#auth_failure',        as: :auth_failure

  # 楽天での検索
  get 'wines/:id/rakuten_search', to: 'wines#rakuten_search', as: :wines_rakuten_search

  resources :users
  resources :wines

  resources :favorites do
    member do
      post "add", to: "favorites#create"
      delete '/add' => 'favorites#destroy'
    end
  end

  resources :favorites, only: [:destroy]
end