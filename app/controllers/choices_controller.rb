class ChoicesController < ApplicationController

  def new
    @choice = Choice.new
    @question = Question.find(params[:question_id])
  end

  def create
  end
end
