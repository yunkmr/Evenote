Rails.application.routes.draw do

  # Userログイン時のルートパス
  authenticated :user do
    root :to => 'homes#top'
  end

  # User非ログイン時のルートパス
  root 'homes#home'
  get 'relationships/follow'

  resources :users, only: [:show,:edit,:update]  do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

  end
  devise_for :users

  get 'relationships/follow'

  resources :events do
    collection do
      get 'search'
    end

    resources :items, only:[:index, :create, :update ,:destroy] do
      collection do
        delete '/' => 'items#destroy_all'
      end
    end

    resources :albums, :except => :show do
      resources :photos, only:[:index, :create, :destroy]
    end
  end

  get 'albums' => 'albums#index_all'

  resources :tickets do
    collection do
      get 'search'
    end
  end

  resources :posts, only: [:index, :show,:create, :update, :destroy] do
    collection do
      get 'post_all'
      get 'post_mine'
    end

    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:index, :create, :destroy]
  end


  #タグによって絞り込んだ投稿を表示するアクションへのルーティング
  resources :tags do
    get 'posts', to: 'posts#search'
  end

  resources :notifications, only: :index

  get 'search' => 'searches#search'
  get 'post_user/search' => 'searches#post_user_search'
  get 'event_user/search' => 'searches#event_user_search'


  resources :rooms, only: [:create, :index, :show]
  resource :chats, only: [:create]

end
