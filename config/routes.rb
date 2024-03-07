Rails.application.routes.draw do
  get 'landing/index'
  get 'landing/retrieve_capsule'
  get '/capsules/:capsule_id/confirmation_page', to: 'confirmation_pages#show', as: 'confirmation_page'
  devise_for :users

  devise_scope :user do
    root to: 'landing#index'
    # root to: 'devise/sessions#new'
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
