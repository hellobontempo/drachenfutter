Rails.application.routes.draw do
  
  root 'welcome#home'

  get '/signup', to: 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :reviews, only: [:index, :edit, :update]
  resources :ingredients

  resources :recipes do
    resources :reviews, only: [:new, :index, :show, :create]
  end
   
  post '/reviews', to: 'reviews#create'

  resources :users do 
    resources :reviews, only: [:index]
  end
  
  
  delete '/logout' => 'sessions#destroy'
  
  match '*unmatched', to: 'application#route_not_found', via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
