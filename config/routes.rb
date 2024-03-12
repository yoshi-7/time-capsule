Rails.application.routes.draw do
  devise_for :users 
  
  root to: "pages#home"

  resources :capsules do
    resources :details, only: [:index]
    resources :medias, only: [:create]
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
    resources :user_capsules, only: [:create]
    resources :encapsulations, only: [:create]
  end
end