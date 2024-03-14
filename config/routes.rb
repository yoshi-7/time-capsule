Rails.application.routes.draw do

  devise_for :users
  get "/home", to: "pages#home", as: :home

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :capsules do
    resources :details, only: [:index]
    resources :medias, only: [:create]
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
    resources :user_capsules, only: [:create]
    resources :encapsulations, only: [:create]
  end
end