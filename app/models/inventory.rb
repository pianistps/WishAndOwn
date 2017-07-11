class Inventory < ApplicationRecord
  has_many :inventory_items
  has_many :items, through: :inventory_items
  belongs_to :user
  validates :name, presence: :true

  def self.user_inventories(user)
    where(user_id: user.id)
  end
end
