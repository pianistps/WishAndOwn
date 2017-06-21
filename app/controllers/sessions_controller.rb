class SessionsController < ApplicationController\

  def new
  end

  def create
    #binding.pry
    @user = User.find_by(email: params[:user][:email])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
