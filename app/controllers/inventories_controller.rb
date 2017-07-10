class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update]
  before_action :logged_in?

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

  def edit
    @user = current_user
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
