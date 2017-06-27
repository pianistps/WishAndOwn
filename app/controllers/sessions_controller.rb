class SessionsController < ApplicationController\

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       @user.errors.add(:password)
       render :new
     end
  end

  def create_facebook
    @user = User.from_omniauth(env["omniauth.auth"])
    #^^Create a user IF his/her unique facebook uid is not in the database ELSE log this person in the app 
    #if the uid exists.
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  def destroy
    session.clear
    redirect_to root_path
  end


end
