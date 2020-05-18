class PinsController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    current_user.like(question)
    redirect_to user_path(current_user)
  end

  def destroy
    question = Question.find(params[:question_id])
    current_user.unlike(question)
    redirect_to user_path(current_user)
  end


end
