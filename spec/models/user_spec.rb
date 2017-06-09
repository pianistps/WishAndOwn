require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Test Factory" do

    it "has a valid user factory with a name, email, and password" do
      expect(build(:user)).to be_valid
    end

  end

  describe "Validations" do

    it "is invalid without a name" do
      expect(build(:user, name: nil)).not_to be_valid
    end

    it "is invalid without an email" do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it "requires a unique email" do
      create(:user, email: "user@email.com")
      user = build(:user, email: "user@email.com")
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it "is invalid without a valid email" do
      expect(build(:user, email: "user.gmail.com")).not_to be_valid
    end

    it "is invalid without a password" do
      expect(build(:user, password: nil)).not_to be_valid
    end

    it "is only valid when the password length is a minimum of 8 characters" do
      expect(build(:user, password: "123")).not_to be_valid
      expect(build(:user, password: "12345678")).to be_valid
    end

    it "encrypts the password upon saving" do
      user = build(:user)
      user.save
      expect(user.password_digest).to be_truthy
      expect(user.password_digest).not_to eq(user.password)
    end
  end

  describe "relationships" do

  end

  describe "class methods" do

  end

  describe "instance methods" do

  end
end
