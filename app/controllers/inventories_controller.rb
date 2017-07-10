class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update]
  before_action :logged_in?, :current_user

  def index
    @inventories = Inventory.all
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
  end

  def edit
  end

  def update
    if @inventory.update(inventory_params)
      redirect_to inventory_path(@inventory)
    else
      render edit_inventory_path(@inventory)
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :user_id)
  end

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

end
