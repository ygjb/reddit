Rails.application.routes.draw do
  root 'links#index'
  
  resources :comments, only: [:create]
  resources :links
  devise_for :user
  
  match '/likes/create_like/:id/:type/:method' => 'likes#create', via: :put, :as => :create_like
  
  namespace :api do
    namespace :v1, format: :json do
      resources :links
      devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout',sign_up: 'sing_up'}
    end
  end  
end
