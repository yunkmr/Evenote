Rails.application.routes.draw do
  root 'homes#top'

  resource :users, only: [:show,:edit,:update]
  resources :events, only:[:new, :create, :show, :index, :edit, :update ,:destroy] do
    resources :items, only:[:create, :index, :update ,:destroy] do
      collection do
        delete '/' => 'items#destroy_all'
      end
    end
  end
  resources :tickets, only:[:new, :create, :show, :index, :edit, :update ,:destroy]

  devise_for :users
end
