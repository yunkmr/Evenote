Rails.application.routes.draw do
  root 'homes#top'

  resource :users, only: [:show,:edit,:update]
  resources :events, only:[:new, :create, :show, :index, :edit, :update ,:destroy]
  resources :tickets, only:[:new, :create, :show, :index, :edit, :update ,:destroy]

  devise_for :users
end
