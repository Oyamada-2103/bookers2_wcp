Rails.application.routes.draw do

  get 'users/show'
  # ２章でdevice入れた際に自動生成
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'homes#top'
  get 'home/about'=> 'homes#about'

  resources :books
  
  resources :users, only: [:show, :edit, :update, :index]
end
