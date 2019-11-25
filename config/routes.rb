Rails.application.routes.draw do
  root 'users#top'
  get '/signup', to: 'users#new'

  resources :users
end
