class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update]
  before_action :logged_in?, :current_user
  before_action :clean_join_tables, only: [:update]

  def index
    @wishlists = Wishlist.user_wishlists(current_user)
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    if @wishlist.save
      redirect_to wishlist_path(@wishlist)
    else
      render new_wishlist_path
    end
  end

  def show
    if @wishlist.items
      @items = @wishlist.items
    end
  end

  def edit
  end

  def update
    if @wishlist.update(wishlist_params)
      redirect_to wishlist_path(@wishlist)
    else
      render edit_wishlist_path(@wishlist)
    end
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:name, :description, :user_id, :items_attributes => [:name, :description, :url])
  end

  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end
end
