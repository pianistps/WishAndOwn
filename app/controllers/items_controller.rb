class ItemsController < ApplicationController
  before_action :logged_in?, :current_user
  before_action :inventory_or_wishlist, only: [:new, :edit, :show, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :destroy_item_clean, only: [:destroy]
  before_action :set_items, only: [:new]

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @item.destroy
    redirect_to user_path(current_user)
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

  def set_items
    @wishlists = current_user.wishlists
    @items = []
    @wishlists.each do |wishlist|
      @items << wishlist.items
    end
    @items.flatten!
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def destroy_item_clean
    if WishlistItem.where(item_id: @item.id)
      WishlistItem.where(item_id: @item.id).destroy_all
    elsif InventoryItem.where(item_id: @item.id)
      InventoryItem.where(item_id: @item.id).destroy_all
    end
  end
end
