class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true
  validates :password, length: { minimum: 8}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
end
