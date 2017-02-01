Rails.application.routes.draw do
  root 'links#index'
  resources :links do;end
  devise_for :user
end
