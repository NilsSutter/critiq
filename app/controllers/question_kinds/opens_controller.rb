class QuestionKinds::OpensController < ApplicationController
  def edit

  end


  def show
    @question = Question.find(params[:id])
  end
end
