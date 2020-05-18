class QuestionsController < ApplicationController
  def index
    @questions = Question.all.page(params[:page]).per(7)
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
  end

  def top

  end

  def about

  end

  def quiz    
    question = Question.all
    @quiz = question.sample
  end

end
