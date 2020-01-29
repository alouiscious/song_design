Rails.application.routes.draw do
  resources :user_rehearsals
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :rehearsals do
    resources :songnotes, only: [:index, :show]

  end

  
  resources :rehearsals
  resources :users
  resources :songs
  resources :songnotes
  resources :userrehearsal

  get 'rehearsals/index'
  root to: 'rehearsals#index'

end
