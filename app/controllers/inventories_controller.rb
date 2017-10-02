class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, :current_user

  def index
    @inventories = Inventory.user_inventories(current_user)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to inventory_path(@inventory)
    else
      render new_inventory_path
    end
  end

  def show
    if @inventory.items
      @items = @inventory.items
    end
  end

  def edit
  end

  def update
    if @inventory.update(inventory_params)
      if params[:inventory][:item_ids]
        clean_join_tables
      end
      redirect_to inventory_path(@inventory)
    else
      render edit_inventory_path(@inventory)
    end
  end

  def destroy
    @inventory.destroy
    redirect_to my_inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :user_id, item_ids:[], :items_attributes => [:name, :description, :url])
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def clean_join_tables
    params[:inventory][:item_ids].each do |id|
      if id != ""
        @item = Item.find(id)
        if WishlistItem.where(item_id: @item.id)
          WishlistItem.where(item_id: @item.id).destroy_all
        end
      end
    end
  end

end
