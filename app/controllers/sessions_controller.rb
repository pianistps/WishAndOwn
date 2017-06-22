class SessionsController < ApplicationController\

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
