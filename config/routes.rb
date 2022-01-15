Rails.application.routes.draw do
  # get 'relationships/followings'
  # get 'relationships/followers'
  root 'homes#top'

  resource :users, only: [:show,:edit,:update]  do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

    # get "new/mail" => "users#new_mail"
    # get "send/mail" => "users#send_mail"

  end

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
  get 'photos' => 'photos#index_all'

  resources :tickets do
    collection do
      get 'search'
    end
  end

  devise_for :users

  resources :posts, only: [:create, :index, :show] do
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

  # get 'post/search' => 'searches#post_search'
  # get 'user/search' => 'searches#user_search'
  # get 'event/search' => 'searches#event_search'
  get 'search' => 'searches#search'
  get 'post_user/search' => 'searches#post_user_search'
  get 'event_user/search' => 'searches#event_user_search'

end
