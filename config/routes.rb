Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: 'pages#home'

  resources :surveys, only: [:index, :new, :create] do
    resources :questions, only: [:new, :create, :show]
  end

  resources :questions do
    resources :choices, only: [:new, :create]
  end

  namespace :question_kinds do
    resources :opens, only: :show
  end
end
