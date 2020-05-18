class MyquestionsController < ApplicationController
  def index
    @myquestions = Myquestion.all
  end

  def new
    @myquestion = Myquestion.new
  end

  def create
    Myquestion.create(myquestion_params)
    redirect_to user_path(current_user)
  end

  def destroy
    myquestion = Myquestion.find(params[:id])
    myquestion.destroy
    redirect_to user_path(current_user)
  end

  private
  def myquestion_params
    params.require(:myquestion).permit(:content).merge(user_id: current_user.id)
  end
end
