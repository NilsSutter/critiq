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
    if @survey.save
      redirect_to edit_survey_path(@survey)
    else
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update!(survey_params)
      redirect_to survey_path(@survey)
    else
      render :edit
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:title, :description, :published, questions_attributes: [:name, :question_type, choices_attributes: [:name, :_destroy]])
  end
end
