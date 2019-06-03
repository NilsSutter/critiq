class SurveysController < ApplicationController

  def index
    # search functionality => queries
    if params[:query].present?
      sql_query = " \
        surveys.title @@ :query \
        OR surveys.description @@ :query \
        OR questions.name @@ :query
      "
      # get surveys that belong to the current user AND fit the search params
      @surveys = current_user.surveys
                             .left_outer_joins(:questions)
                             .where(sql_query, query: "%#{params[:query]}%")
                             .distinct
    else
      @surveys = current_user.surveys
    end
    @survey = Survey.new
    if params[:id].present?
      @questions = Survey.find(params[:id]).display_responses
    else
      @questions = nil
    end
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
    @questions = Survey.find(params[:id]).display_responses
    # render json: @questions_json
    render json: { html: render_to_string(partial: "question_responses", locals: {all_questions: @questions}) }
    # redirect_to surveys_path(id: params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])

    fetch_slack_channels = GetSlackChannelsJob.perform_now
    if fetch_slack_channels["ok"]
      # Format for Select2. Very picky.
      channel_array = []
      fetch_slack_channels["channels"].each do |chan|
        channel_array << {id: chan["id"], name: chan["name"]}
      end
      @slackchannels = channel_array
    else
      @slackchannels = { error: true }
    end
  end

  # updates and sends out survey
  def update
    @survey = Survey.find(params[:id])
    if params[:commit] == "Send"
      # update and send
      if @survey.update(survey_params)
        @survey.send_first_question
        redirect_to survey_path(@survey)
      else
        render :edit
      end
    elsif params[:commit] == "Save"
      # only save
      if @survey.update(survey_params)
        redirect_to survey_path(@survey)
      else
        render :edit
      end
    end
  end

  # new route for only save action
  # def update_and_send
  #   @survey = Survey.find(params[:id])
  #   if @survey.update(survey_params)
  #     @survey.send_first_question
  #     redirect_to survey_path(@survey)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :description, :published, :channel_id, questions_attributes: [:name, :question_type, :multiple_choice, choices_attributes: [:name, :_destroy]])
  end
end
