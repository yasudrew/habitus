class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @myquestions = @user.myquestions
  end

  def likes
    @user = User.find_by(id: params[:id])
    @pins = Pin.where(user_id: @user.id)
  end
end
