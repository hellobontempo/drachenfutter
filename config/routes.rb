Rails.application.routes.draw do
  
  root 'welcome#home'

  get '/signup', to: 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :reviews
  resources :ingredients

  resources :recipes do
    resources :reviews, only: [:new, :index, :show, :create]
  end

  resources :users do 
    resources :reviews, only: [:index]
  end
  
  
  delete '/logout' => 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
