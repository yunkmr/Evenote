Rails.application.routes.draw do
  root 'homes#top'

  resource :users, only: [:show,:edit,:update]


  devise_for :users
end
