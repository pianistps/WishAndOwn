require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid user factory"

  it "is valid with a name, email, and password"

  it "is invalid without an email"

  it "is invalid without a valid email"

  it "is invalid without a password"

  it "is only valid when the password length is a minimum of 8 characters"

  it "encrypts the password upon saving"
end
