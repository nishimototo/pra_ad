Rails.application.routes.draw do

  get 'searches/search'
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about"
  get "search" => "searches#search"

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "follows", on: :member
    get "followers", on: :member
  end

  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
