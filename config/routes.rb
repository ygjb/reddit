Rails.application.routes.draw do
  root 'links#index'
  resources :links do
    resources :comments, only: [:create]
  end
  devise_for :user
  
  namespace :api do
    namespace :v1, format: :json do
      resources :links
    end
  end  
end
