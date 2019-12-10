Rails.application.routes.draw do
  get 'wines/new'
  get 'sessions/new'
  root 'users#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # twitterでログイン
  get 'auth/:provider/callback' => 'users#create_by_twitter'#このpathを通して認証が行われる。

  resources :users
  resources :wines
end
