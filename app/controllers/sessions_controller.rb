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
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.uid = auth['uid']
      u.password = SecureRandom.urlsafe_base64 unless u.password != nil
    end
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
