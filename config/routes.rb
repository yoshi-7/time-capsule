Rails.application.routes.draw do
  get 'landing/index'
  get 'landing/retrieve_capsule'
  devise_for :users

  devise_scope :user do
    root to: 'landing#index'
    # root to: 'devise/sessions#new'
  end

  resources :capsules do
    resources :medias, only: [:create]
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
    resources :user_capsules, only: [:create]
    get '/confirmation', to: 'capsules#confirmation'
  end
  # resources :messages, only: [:destroy]
end
