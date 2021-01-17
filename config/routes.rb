Rails.application.routes.draw do
  resources :measurements
  resources :reviews
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/show'
  resources :recipes
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/show'
  resources :ingredients
  get 'ingredients/index'
  resources :users
  get '/signup', to: 'users#new'
  post '/users/new', to: 'users#create'
  get 'users/show'
  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
