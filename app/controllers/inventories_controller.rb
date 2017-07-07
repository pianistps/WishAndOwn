class InventoriesController < ApplicationController
  #before_action :set_inventory, only: [:show]

  def index
  end

  def new
    @inventory = Inventory.new
    @user = current_user
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

  private

  def inventory_params
    params.require(:inventory).permit(:name, :user_id)
  end

  # def set_inventory
  #   @inventory = Inventory.find(params[:])
  # end

end
