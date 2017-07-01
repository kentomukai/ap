Rails.application.routes.draw do

  #メイン画面
  root 'static_pages#home'
  
  get    '/admin',   to: 'users#index'
  get    'api',      to: 'connections#api'
  get    '/detail',  to: 'static_pages#detail'
  get    '/search',  to: 'connections#connect'
  get    '/help',    to: 'static_pages#help'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
