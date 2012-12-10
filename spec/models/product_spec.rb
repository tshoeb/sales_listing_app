require 'spec_helper'

describe Product do
	describe "Validation Macros" do
        it {should validate_presence_of(:name)}
        it {should validate_presence_of(:price)}
        it {should validate_presence_of(:description)}
        it {should validate_presence_of(:color)}
        it {should validate_presence_of(:brand)}
        it {should validate_presence_of(:listing_date)}
        it {should validate_presence_of(:expiry_date)}
    end
	it "should have the correct associations" do
	    should belong_to(:user)
	end
	describe "All factories are properly created" do
        before(:each) do
        	@talal = FactoryGirl.create(:user)
            @iphone = FactoryGirl.create(:product, :user => @talal)
            @ipad = FactoryGirl.create(:product, :name => "iPad", :listing_date => 8.days.ago, :user => @talal)
            @ipod = FactoryGirl.create(:products, :name => "iPod", :listing_date => 6.days.ago)
        end
        it "should check the creation of products" do
            @iphone.should be_valid
            @ipad.should be_valid
            @ipod.should be_valid
            @iphone.name.should == "iPhone"
            @ipad.name.should == "iPad"
            @ipod.name.should == "iPod"
        end
        describe "Testing Scopes" do
	        it "should put products in chronological order of listing date" do
	            dates = Array.new
	            dates << 10.days.ago.to_date
	            dates << 8.days.ago.to_date
	            dates << 6.years.ago.to_date
	            Product.chronological.map{|p| p.listing_date}.should == dates
	        end
	        it "should allow us to return the product for a given user" do
	            Product.for_user(@talal.id).size.should == 2
	        end
	        it "should allow us to return the latest 'x' visits" do
	            Product.for_user(@talal.id).latest(5).size.should == 2
	            Product.for_user(@talal.id).latest(1).size.should == 1
	        end
	    end
    end
end
