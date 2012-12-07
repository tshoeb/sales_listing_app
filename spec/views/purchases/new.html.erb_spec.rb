require 'spec_helper'

describe "purchases/new" do
  before(:each) do
    assign(:purchase, stub_model(Purchase,
      :member_id => 1,
      :product_id => 1
    ).as_new_record)
  end

  it "renders new purchase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchases_path, :method => "post" do
      assert_select "input#purchase_member_id", :name => "purchase[member_id]"
      assert_select "input#purchase_product_id", :name => "purchase[product_id]"
    end
  end
end
