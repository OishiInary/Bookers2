Rails.application.routes.draw do
 devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#top"
  resources :users, only: [:show, :edit, :index, :edit, :update, :create]
  
  resources :books, only: [:new, :index, :show, :destroy, :create, :edit, :update]
  get "/home/about" => "home#about", as: "about"
end
