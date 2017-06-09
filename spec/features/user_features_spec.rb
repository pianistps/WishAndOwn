require_relative "../rails_helper.rb"

describe "User Signup", type: :feature do
  before do
    @user1 = create(:user)
  end

  it  "successfully signs up" do
    visit_signup
    expect(current_path).to eq('/users/new')
    user_signup
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Welcome #{@user1.name}")
  end

end
