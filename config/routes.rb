Rails.application.routes.draw do
  root 'homes#top'

  resource :users, only: [:show,:edit,:update] do
  end

  resources :events, only:[:new, :create, :show, :index, :edit, :update ,:destroy] do
    resources :items, only:[:create, :index, :update ,:destroy] do
      collection do
        delete '/' => 'items#destroy_all'
      end
    end

    resources :albums, only:[:index, :new, :show, :create, :edit, :update, :destroy] do
      resources :photos, only:[:index, :create, :destroy]
    end
  end

  resources :tickets, only:[:new, :create, :show, :index, :edit, :update ,:destroy]
  # resources :albums, only:[:new, :show, :create, :edit, :update, :destroy] do
  #   resources :photos, only:[:index, :new, :create, :edit, :update, :destroy]
  # end

  devise_for :users

  resources :posts
  #タグによって絞り込んだ投稿を表示するアクションへのルーティング
  resources :tags do
    get 'posts', to: 'posts#search'
  end

end
