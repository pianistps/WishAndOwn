class SessionsController < ApplicationController\

  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       @user.authenticate(params[:user][:password])
       render new_session_path
     end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
