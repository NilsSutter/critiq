class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @survey = Survey.find(params[:survey_id])
    @boolean = @question.multiple_choice
  end

  def create
    @question = Question.new(question_params)
    @survey = Survey.find(params[:survey_id])
    @question.survey = @survey
    # @boolean = @question.multiple_choice
    if @question.save!
      if @question.question_type == "text"
        redirect_to new_survey_question_path
      else
        redirect_to survey_question_path(@question)
      end
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def find_boolean
  end

  def question_params
    require(:question).permit(:name, :question_type)
  end
end
