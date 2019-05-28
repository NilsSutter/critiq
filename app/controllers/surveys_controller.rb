class SurveysController < ApplicationController
  # get all surveys that belong to the logged in user
  def index
    @surveys = Survey.where(id: current_user.id)
  end

  def new
    @survey = Survey.new
  end

  def create
  end
end
