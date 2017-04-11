Rails.application.routes.draw do
  root 'links#index'
  
  devise_for :users #do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  resources :comments, only: [:create]
  resources :links
  
  match '/likes/create_like/:id/:type/:method' => 'likes#create', via: :put, :as => :create_like
  
  namespace :api do
    namespace :v1, format: :json do
      resources :links
      devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout',sign_up: 'sing_up'}
    end
  end  
end
