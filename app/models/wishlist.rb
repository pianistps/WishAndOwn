class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlist_items
  has_many :items, through: :wishlist_items

  def self.user_wishlists(user)
    where(user_id: user.id)
  end
end
