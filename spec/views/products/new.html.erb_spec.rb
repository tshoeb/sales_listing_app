require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :member_id => 1,
      :name => "MyString",
      :price => "MyString",
      :description => "MyString",
      :color => "MyString",
      :brand => "MyString",
      :fragile => false,
      :available => false
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_member_id", :name => "product[member_id]"
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_description", :name => "product[description]"
      assert_select "input#product_color", :name => "product[color]"
      assert_select "input#product_brand", :name => "product[brand]"
      assert_select "input#product_fragile", :name => "product[fragile]"
      assert_select "input#product_available", :name => "product[available]"
    end
  end
end
