class SurveysController < ApplicationController
  # get all surveys that belong to the logged in user
  def index
    @surveys = Survey.where(user_id: current_user.id)
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    if @survey.save!
      redirect_to new_survey_question_path(@survey)
    else
      rendern :new
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description)
  end
end
