Rails.application.routes.draw do
  root 'homes#top'

  resource :users, only: [:show,:edit,:update]
  resources :events, only:[:new, :create, :show, :index, :edit, :update ,:destroy] do
    resources :items, only:[:create, :index, :update ,:destroy] do
      collection do
        delete '/' => 'items#destroy_all'
      end
    end

    resources :albums, only:[:index, :new, :show, :create, :edit, :update, :destroy] do
      resources :photos, only:[:index]
    end
  end

  resources :tickets, only:[:new, :create, :show, :index, :edit, :update ,:destroy]
  # resources :albums, only:[:new, :show, :create, :edit, :update, :destroy] do
  #   resources :photos, only:[:index, :new, :create, :edit, :update, :destroy]
  # end

  devise_for :users
end
