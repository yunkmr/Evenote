Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "/" => 'homes#top'
end
