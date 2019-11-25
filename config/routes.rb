Rails.application.routes.draw do
  root 'users#top'
  get 'users/new'
  resources :users
end
