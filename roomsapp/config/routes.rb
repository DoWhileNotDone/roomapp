Rails.application.routes.draw do
  get 'home/index'

  resources :rooms
  resources :persons
  resources :occupancies

  root 'home#index'

end
