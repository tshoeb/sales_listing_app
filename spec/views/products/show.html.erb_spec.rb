require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :user_id => 1,
      :name => "Name",
      :price => "Price",
      :description => "Description",
      :color => "Color",
      :brand => "Brand",
      :fragile => false,
      :available => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Price/)
    rendered.should match(/Description/)
    rendered.should match(/Color/)
    rendered.should match(/Brand/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
