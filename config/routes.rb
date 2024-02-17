Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :capsules do
    resources :messages, only: [:new, :create, :edit, :update]
    resources :user_capsules, only: [:create]
  end
  resources :messages, only: [:destroy]
end
