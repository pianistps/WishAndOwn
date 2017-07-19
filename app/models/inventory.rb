class Inventory < ApplicationRecord
  has_many :inventory_items
  has_many :items, through: :inventory_items
  belongs_to :user
  validates :name, presence: :true

  def self.user_inventories(user)
    where(user_id: user.id)
  end

  def items_attributes=(item_hashes)
    item_hashes.each do |i, item_attributes|
      if item_attributes[:name].present?
        binding.pry
        item = Item.find_or_create_by(:name, item_attributes[:name])
        if !self.items.include?(item)
          self.inventory_items.build(item: item)
        end
      end
    end
  end
end
