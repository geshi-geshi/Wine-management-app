Rails.application.routes.draw do
  get 'wines/new'
  get 'sessions/new'
  root 'users#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # snsでログイン
  get 'auth/:provider/callback', to: 'sessions#sns_login',    as: :auth_callback
  get '/auth/failure',         to: 'sessions#auth_failure',        as: :auth_failure

  # get  '/twitter_login', to: 'sessions#twitter'

  # 楽天での検索
  get 'wines/:id/rakuten_search', to: 'wines#rakuten_search', as: :wines_rakuten_search

  resources :users
  resources :wines
end
