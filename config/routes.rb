Rails.application.routes.draw do
  root "pokemon#index"
  resources :pokemon, only: [:index, :new]

end
