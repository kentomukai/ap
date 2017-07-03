Rails.application.routes.draw do

  #メイン画面
  root 'static_pages#home'
  
  #コントローラとビュー
  get    '/login',   to: 'sessions#new'
  get    '/admin',   to: 'users#admin'
  get    '/detail',  to: 'static_pages#detail'
  get    '/help',    to: 'static_pages#help'
  
  #コントローラの実行のみ
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/search',  to: 'connections#simple'
  post   '/api',     to: 'connections#api'
  post   '/noapi',   to: 'connections#noapi'
  
end
