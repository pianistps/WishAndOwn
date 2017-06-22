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

describe "User Signout", type: :feature do

  it 'has a link to log out from the users/show page' do
    @user2 = build(:user)
    visit '/'
    click_link('Sign Up')
    fill_in("user[name]", :with => @user2.name)
    fill_in("user[email]", :with => @user2.email)
    fill_in("user[password]", :with => @user2.password)
    click_button('Sign Up')
    expect(page).to have_content("Log Out")
  end

  it 'redirects to home page after logging out' do
    @user3 = build(:user)
    visit '/'
    click_link('Sign Up')
    fill_in("user[name]", with: @user3.name)
    fill_in("user[email]", with: @user3.email)
    fill_in("user[password]", with: @user3.password)
    click_button('Sign Up')
    click_link("Log Out")
    expect(current_path).to eq('/')
  end

  it "successfully destroys session hash when 'Log Out' is clicked" do
    @user4 = build(:user)
    visit '/'
    click_link('Sign Up')
    fill_in("user[name]", with: @user4.name)
    fill_in("user[email]", with: @user4.email)
    fill_in("user[password]", with: @user4.password)
    click_button("Sign Up")
    click_link("Log Out")
    expect(page.get_rack_session).to_not include("user_id")
  end

end
