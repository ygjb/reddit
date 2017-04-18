Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  resources :comments, only: [:create]
  devise_for :user
  match '/likes/create_like/:id/:type/:method' => 'likes#create', via: :put, :as => :create_like
  
  namespace :api do
    namespace :v1, format: :json do
      resources :posts
      devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout',sign_up: 'sing_up'}
    end
  end  
end
