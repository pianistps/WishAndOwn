require_relative "../rails_helper.rb"

describe "User Signup", type: :feature do

  it  "successfully signs up" do
    @user1 = build(:user)
    visit '/'
    click_link('Sign Up')
    expect(current_path).to eq('/users/new')
    fill_in("user[name]", :with => @user1.name)
    fill_in("user[email]", :with => @user1.email)
    fill_in("user[password]", :with => @user1.password)
    click_button('Create User')

    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Welcome #{@user1.name}")
  end

end
