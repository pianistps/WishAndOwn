class User < ApplicationRecord
  has_secure_password

  has_many :wishlists
  has_many :inventories
  
  validates :name, :email, presence: true
  validates :password, length: { minimum: 8}
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

end
