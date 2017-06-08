require 'faker'
FactoryGirl.define do
  factory :user do
    name { Faker::Name }
    email { Faker::Internet.email }
    password_digest "password123"
  end
end
