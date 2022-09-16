Rails.application.routes.draw do
  root "pokemon#index"
  resources :pokemon, only: [:index, :new, :create, :show]
  get '/pokemon/random_pokemon', to: 'pokemon#random_pokemon'
end
