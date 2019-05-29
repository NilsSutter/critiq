Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: 'pages#home'

  resources :surveys, only: [:index, :new, :create, :edit, :update, :show] do
    resources :questions, only: [:new, :create, :show]
  end

  # Sidekiq Web UI, only for admins.
 require "sidekiq/web"
 authenticate :user, lambda { |u| u.admin } do
   mount Sidekiq::Web => '/sidekiq'
 end
end
