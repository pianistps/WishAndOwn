class ItemsController < ApplicationController
  before_action :logged_in?, :current_user
  before_action :inventory_or_wishlist, only: [:new, :edit, :show]

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def inventory_or_wishlist
    request = self.request.env["REQUEST_PATH"].split("/")
    if /wishlists/.match(request[1])
      @parent = Wishlist.find(params[:wishlist_id])
    elsif /inventories/.match(request[1])
      @parent = Inventory.find(params[:inventory_id])
    end
    @parent
  end
end
