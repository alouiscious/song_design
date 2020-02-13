Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :rehearsals do [:index, :show, :new, :create, :edit, :update, :delete]
    resources :songnotes, only: [:index, :show, :new, :create, :edit, :update]
  end 

  resources :songs do
    resources :songnotes, only: [:index, :show, :new, :create, :edit, :update]
  end
  
  resources :users do
    resources :songnotes, only: [:index, :show, :new, :create, :edit, :update]
  end
  
  resources :rehearsals
  resources :users
  resources :songs
  resources :songnotes
  resources :user_rehearsals

  get 'rehearsals/index'
  root to: 'rehearsals#index'

end
