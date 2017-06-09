require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid user factory with a name, email, and password" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:user, name: nil)).not_to be_valid
  end

  it "is invalid without an email" do
    expect(build(:user, email: nil)).not_to be_valid
  end

  it "is invalid without a valid email"

  it "is invalid without a password"

  it "is only valid when the password length is a minimum of 8 characters"

  it "encrypts the password upon saving"
end
