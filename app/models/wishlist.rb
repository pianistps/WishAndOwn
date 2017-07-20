class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlist_items
  has_many :items, through: :wishlist_items
  validates :name, presence: :true
  validates :name, uniqueness: :true

  def self.user_wishlists(user)
    where(user_id: user.id)
  end

  def items_attributes=(item_hashes)
    item_hashes.each do |i, item_attributes|
      if item_attributes[:name].present?
        item = Item.find_or_create_by(:name => item_attributes[:name])
        if item_attributes[:description].present?
          item[:description] = item_attributes[:description]
          item.save
        end
        if item_attributes[:url].present?
          item[:url] = item_attributes[:url]
          item.save
        end
        if !self.items.include?(item)
          self.wishlist_items.build(item: item)
        end
      end
    end
  end
end
