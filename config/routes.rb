Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'home/about' =>'homes#about'
   resources :users, only: [:show,:edit, :update,:index]do
    member do
     get 'following'
     get 'followers'
  end
  end
  resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update] do
   resource :favorites, only: [:create, :destroy]
   resource :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end

