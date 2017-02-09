Rails.application.routes.draw do
  root 'links#index'
  resources :links do
    resources :comments, only: [:create]
  end
  devise_for :user
end
