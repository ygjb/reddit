Rails.application.routes.draw do
  default_url_options :host => "example.com"
  
  root 'links#index'
  resources :links do
    resources :comments, only: [:create]
  end
  devise_for :user
  
  namespace :api do
    namespace :v1, format: :json do
      resources :links
      devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
    end
  end  
end
