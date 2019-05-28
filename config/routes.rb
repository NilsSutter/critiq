Rails.application.routes.draw do

  # BEGIN Temporary routes for Slackbot Testing
  post '/slack/send', to: 'slack#send_survey'
  get '/slack/home', to: 'slack#home'
  # END

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
