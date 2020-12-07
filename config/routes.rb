Rails.application.routes.draw do

  get '/search' => 'search#search'
  devise_for :users
  
  root :to => "homes#top"
  get "home/about" => "homes#about"
  
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    
  end
  resources :users, only: [:index, :show, :edit, :update]
  resource :relationships, only: [:create, :destroy]
end