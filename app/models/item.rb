class Item < ApplicationRecord
  has_many :inventory_items
  has_many :wishlist_items
end
