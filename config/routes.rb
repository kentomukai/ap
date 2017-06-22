Rails.application.routes.draw do

  #メイン画面
  root 'static_pages#home'

  get 'sessions/new'
  get    '/help',    to: 'static_pages#help'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
