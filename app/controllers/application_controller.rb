class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    if !session[:user_id]
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id]) # Use find_by_id to get nil instead of an error if user doesn't exist
  end
  helper_method :current_user #make this method available in views

end
