Rails.application.routes.draw do
  resources :logs
  resources :tracks
  root 'pages#home'
  resources :memberships
  resources :groups
  devise_for :users
  get '/auth/spotify/callback', to: 'users#spotify'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
