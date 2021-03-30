Rails.application.routes.draw do
  get '/signup', to: "users#new", as: "signup"
  post '/users', to: "users#create"
  
  get '/login', to: 'sessions#new', as: "login"
  post 'login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users

  resources :families, only: [:index, :show] do
    resources :categories
  end

  resources :categories, only: [:index, :show]
  resources :makers, only: [:index, :show]
  resources :instruments

  end 


  # namespace :admin do
  #   resources :info, only: [:index]
  #above is the same as
  # scope 'admin', module: 'admin' do
  #   #first is URL prefix, second is module name
  #   resources :info, only: [:index]
  # end
  # scope '/admin' do #the 1st part of the url
    # resources :info, only: [:index] 
    #the 2nd part of the url (which is also the controller)
    #the action
  # end
  # above is the same as
  # get 'admin/info', to: 'info#index'
# end
