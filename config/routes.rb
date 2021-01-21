Rails.application.routes.draw do
  resources :reviews
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'reviews/edit'
  # get 'reviews/show'

  resources :recipes

  resources :recipes do
    resources :reviews, only: [:new, :index, :show, :create]
  end

  post '/recipes/create', to: 'recipes#show'
  
  # get 'recipes/new'
  # get 'recipes/create'
  # get 'recipes/show'

  resources :ingredients
 
  # get 'ingredients/index'

  resources :users do 
    resources :reviews, only: [:index]
  end
  
  get '/signup', to: 'users#new'
  post '/users/new', to: 'users#create' 
  get 'users/show'
  root 'welcome#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  delete '/logout' => 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
