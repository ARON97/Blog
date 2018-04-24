Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles # A new article path 

  # sending signup to usersnew
  get 'signup', to: 'users#new' # users sign up route
  # the users path for the post action
  # post 'users', to: 'users#create' # route to users_controller create action
  resources :users, except: [:new] # the same as the above code

  # Login route
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  # handle logout
  delete 'logout', to: 'sessions#destroy'
end
