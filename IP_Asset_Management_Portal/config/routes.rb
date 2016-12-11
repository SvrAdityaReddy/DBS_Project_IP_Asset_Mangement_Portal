Rails.application.routes.draw do
  resources :owns
  resources :creations
  get '/validateIP/:id', :to => 'pages#validateIP', as: "validateIP"
  post '/validateIP/:id', :to => 'pages#validate', as: "validate"
  
  get '/vlic', :to=> 'pages#vlic'
  get '/home', :to => 'pages#home'
  get '/owned', :to => 'pages#owned'
  get '/admin', :to => 'pages#admin'
  post 'modify', :to => 'pages#modify'
  post 'add', :to => 'license_tos#add'
  get '/committee', :to => 'pages#committee'
  get '/validation', :to => 'pages#validation'
  get '/ecom', :to => 'pages#ecom'
  get '/inprocess', :to => 'pages#inprocess'
  get '/al', :to => 'pages#al'
  get '/fileIP', :to=> 'pages#FIP'
  get '/license', :to=> 'pages#addlicense'
  get '/addowner', :to=> 'pages#addown'
  get '/public', :to => 'pages#pubip'
  post 'money', :to => 'owns#money'

  resources :license_tos
  devise_for :users, :controllers => {
  	:registrations =>'users/registrations'
  }
  root to: 'pages#home'
end
