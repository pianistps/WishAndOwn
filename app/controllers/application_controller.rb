class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    if !session[:user_id]
      redirect_to root_path
    end
  end
end
