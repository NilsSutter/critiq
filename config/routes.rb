Rails.application.routes.draw do

  # BEGIN Temporary routes for Slackbot Testing
  post '/slack/send', to: 'slack#send_survey'
  get '/slack/home', to: 'slack#home'
  # END

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
