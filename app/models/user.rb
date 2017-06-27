class User < ApplicationRecord
  has_secure_password
  validates :name, :email, presence: true
  validates :password, length: { minimum: 8}
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name unless user.name != nil
      user.email =  SecureRandom.hex + '@example.com' unless user.email != nil
      user.activated = true
      user.password = SecureRandom.urlsafe_base64 unless user.password != nil
      user.save!
    end
  end
end


#Here we try to find a user that matches the given provider and uid values from the hash and then we call
#first_or_initialize on the result of this. This method will either return the first matching record or
#initialize a new record with the parameters that were passed in. We then call tap on this to pass that User instance
#to the block. Inside the block we set various attributes on the user based on values from the OmniAuth hash.
#You might be interested as to why did I put the unless statement after some of the attribute initializations.
#Well consider the situation whereby the user wants to update the profile, like change the name or smth, and then
#logs out. When that user finally decides to log back in, the .from_omniauth method will overwrite the User's
#in question update to the original facebook values, unless we stop it from doing so.
#Also notice the use of SecureRandom library. Inside of the traditional authentication that was used by
#Michael Hartl inside his book, he introduces validations to email and password submissions.
#Emails must be neither blank nor taken. Likewise, a password has to be greater than 6 characters in length.
#Since emails have to be present and unique I decided to create dummy emails using SecureRandom.hex + @example.com.
#This will create a random hexadecimal string, like 52750b30ffbc7de3b362, and #append it to @example.com,
#hence generating the unique dummy email. Same goes for the password, however, I preferred to generate a random
# base64 string using  SecureRandom.urlsafe_base64. The most important thing to remember that Facebook users
#don't need to know this information to login since that is the whole point of using Facebook authentication.
#This allows them to add this information with real data later on if they desire to do so.
