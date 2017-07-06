class InventoriesController < ApplicationController

  def index
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

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end

end
