Rails.application.routes.draw do
  get 'landing/index'
  get 'landing/retrieve_capsule'
  devise_for :users

  devise_scope :user do
    root to: 'landing#index'
    # root to: 'devise/sessions#new'
  end

  resources :capsules do
    resources :confirmations, only: [:index, :create]
    resources :details, only: [:index, :create]
    resources :medias, only: [:create]
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
    resources :user_capsules, only: [:create]
  end
end
