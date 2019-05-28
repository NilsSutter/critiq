class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected
  # redirecting after log in enabled
  # def after_sign_in_path_for(resource)
  #   surveys_path
  # end
end
