class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @survey = Survey.find(params[:survey_id])
    @boolean = @question.multiple_choice
    # @question.choices.build
  end

  def create
    @question = Question.new(question_params)
    @survey = Survey.find(params[:survey_id])
    @question.survey = @survey
    if @question.save!
      if @question.question_type == "text"
        redirect_to new_question_choice_path
      else
        redirect_to survey_question_path(@survey, @question)
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
    params.require(:question).permit(:name, :question_type, choices_attributes: [:name, :_destroy])
  end
end
