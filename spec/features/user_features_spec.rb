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
    click_button('Sign Up')

    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Welcome #{@user1.name}")
  end

  it "on sign up, successfully adds a session hash" do
    @user1 = build(:user)
    visit '/'
    click_link('Sign Up')
    fill_in("user[name]", :with => @user1.name)
    fill_in("user[email]", :with => @user1.email)
    fill_in("user[password]", :with => @user1.password)
    click_button('Sign Up')
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it "on log in, successfully adds a session hash" do
    @user = create(:user)
    visit '/'
    click_link('Sign In')
    fill_in("user[email]", :with => @user.email)
    fill_in("user[password]", :with => @user.password)
    click_button('Sign In')

    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'prevents user from viewing user show page and redirects to home page if not logged in' do
    create(:user)
    visit '/users/1'
    expect(current_path).to eq('/')
    expect(page).to have_content("Sign Up")
  end


end
