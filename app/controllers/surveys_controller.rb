class SurveysController < ApplicationController

  def index
    # search functionality => queries
    if params[:query].present?
      sql_query = " \
        surveys.title ILIKE :query \
        OR surveys.description ILIKE :query \
        OR questions.name ILIKE :query \
      "
      # get surveys that belong to the current user AND fit the search params
      @surveys = Survey.where(user_id: current_user.id).joins(:questions).where(sql_query, query: "%#{params["query"]}%")
    else
      @surveys = Survey.where(user_id: current_user.id)
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    if @survey.save!
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
    params.require(:survey).permit(:title, :description, questions_attributes: [:name, :question_type, choices_attributes: [:name, :_destroy]])
  end
end
