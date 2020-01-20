Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rehearsals
  resources :musicians
  resources :songs
  resources :song_notes

  # get 'rehearsals/index'
  root to: 'rehearsals#index'

end
