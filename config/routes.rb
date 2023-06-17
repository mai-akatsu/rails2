Rails.application.routes.draw do
  
  get 'users/account'
  get 'users/profile'
  get 'pages/home'
  get 'pages/tokyo'
  get 'pages/kyoto'
  get 'pages/osaka'
  get 'pages/sapporo'
  get 'pages/account'
  get 'pages/profile'
  get 'search' => "pages#search"
  get 'rooms/own'
  
  
  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
      post 'back'
    end
  end

  root 'pages#home'
  
  devise_for :users
  resources :rooms  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
