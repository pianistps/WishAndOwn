class Inventory < ApplicationRecord
  has_many :inventory_items
  has_many :items, through: :inventory_items
  belongs_to :user
  validates :name, presence: :true
end
