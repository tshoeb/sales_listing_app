require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :user_id => 1,
        :name => "Name",
        :price => "Price",
        :description => "Description",
        :color => "Color",
        :brand => "Brand",
        :fragile => false,
        :available => false
      ),
      stub_model(Product,
        :user_id => 1,
        :name => "Name",
        :price => "Price",
        :description => "Description",
        :color => "Color",
        :brand => "Brand",
        :fragile => false,
        :available => false
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
