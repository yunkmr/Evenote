Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root 'homes#top'

  resource :users, only: [:show,:edit,:update]  do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

    get "new/mail" => "users#new_mail"
    get "send/mail" => "users#send_mail"

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

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:index, :create, :destroy]
  end


  #タグによって絞り込んだ投稿を表示するアクションへのルーティング
  resources :tags do
    get 'posts', to: 'posts#search'
  end

  resources :notifications, only: :index

end
