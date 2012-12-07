require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :password_digest => "Password Digest",
      :first_name => "First Name",
      :last_name => "Last Name",
      :country => "Country",
      :phone => "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Password Digest/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Country/)
    rendered.should match(/Phone/)
  end
end
