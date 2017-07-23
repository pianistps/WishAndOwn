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


  def clean_join_tables
    if /inventories/.match(params[:controller])
      @item = Item.find_by(name: params[:inventory][:items_attributes][:'0'][:name])
      WishlistItem.where(item_id: @item.id).destroy_all
    elsif /wishlists/.match(params[:controller])
      @item = Item.find_by(name: params[:inventory][:items_attributes][:'0'][:name])
      InventoryItem.where(item_id: @item.id).destroy_all
    end
  end
end
