class InventoriesController < ApplicationController

  def index
    @inventories = Inventory.all
  end

  def new
  end

  def create
  end

end
