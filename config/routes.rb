Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :capsules do
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
    resources :user_capsules, only: [:create]
    get '/confirmation', to: 'capsules#confirmation'
  end
  # resources :messages, only: [:destroy]
end
