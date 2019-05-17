Rails.application.routes.draw do
  root 'ideas#index'

  resources :users, only: [:create, :edit, :update, :destroy]
  resources :sessions, only: [:create, :destroy]
  resources :ideas, only: [:create, :show, :edit, :new, :update, :destroy] do
    member do
      put "like" => "ideas#upvote"
      put "unlike" => "ideas#downvote"
    end
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end