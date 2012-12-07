require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :password_digest => "Password Digest",
        :first_name => "First Name",
        :last_name => "Last Name",
        :country => "Country",
        :phone => "Phone"
      ),
      stub_model(User,
        :email => "Email",
        :password_digest => "Password Digest",
        :first_name => "First Name",
        :last_name => "Last Name",
        :country => "Country",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
