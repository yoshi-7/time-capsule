Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    # root to: 'devise/sessions#new'
    root to: "pages#home"
  end

  resources :capsules do
    resources :confirmations, only: [:index]
    resources :details, only: [:index]
    resources :medias, only: [:create]
    resources :messages, only: [:new, :create, :edit, :update, :destroy]
    resources :user_capsules, only: [:create]
    resources :encapsulations, only: [:create]
  end
end
