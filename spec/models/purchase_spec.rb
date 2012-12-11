require 'spec_helper'

describe Purchase do
	 describe "Validation Macros" do
        it {should validate_presence_of(:user_id)}
        it {should validate_presence_of(:product_id)}
        it {should validate_presence_of(:purchase_date)}
        it {should validate_presence_of(:delivery_date)}
    end
    it "should have the correct associations" do
	    should belong_to(:user)
	    should belong_to(:product)
	end
	describe "All factories are properly created" do
        before(:each) do
        	@talal = FactoryGirl.create(:user)
        	@iproduct = FactoryGirl.create(:product)
            @iphone = FactoryGirl.create(:purchase, :user => @talal, :product => @iproduct)
            @iphone2 = FactoryGirl.create(:purchase, :user => @talal, :product => @iproduct, :purchase_date => 2.days.from_now)
        end
        it "should check the creation of products" do
            @talal.should be_valid
            @iproduct.should be_valid
            @iphone.should be_valid
        end
        describe "Testing Scopes" do
	        it "should put products in chronological order of purchase date" do
	            dates = Array.new
	            d = Date.today
	            d += 2
	            dates << d
	            dates << Date.today
	            Purchase.chronological.map{|p| p.purchase_date}.should == dates
	        end
	        it "should allow us to return the purchase for a given product" do
	            Purchase.for_product(@iproduct.id).size.should == 2
	        end
	        it "should allow us to return the latest 'x' visits" do
	            Purchase.for_product(@iproduct.id).latest(1).size.should == 1
	        end
	    end
    end
end
