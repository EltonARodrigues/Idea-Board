Rails.application.routes.draw do
  root 'ideas#index'

  resources :ideas, only: [:create, :show, :new, :destroy]
end
