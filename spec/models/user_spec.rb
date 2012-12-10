require 'spec_helper'

describe User do
  describe "Validation Macros" do
        it {should validate_presence_of(:first_name)}
        it {should validate_presence_of(:last_name)}
        it {should validate_presence_of(:email)}
        it {should validate_presence_of(:phone)}
    end
    describe "Validates good emails" do
        it {should allow_value("fred@fred.com").for(:email)}
        it {should allow_value("fred@qatar.cmu.edu").for(:email)}
    end
    describe "Rejects bad emails" do
        it {should_not allow_value("fred").for(:email)}
        it {should_not allow_value("fred@fred,com").for(:email)}
    end
    describe "Validates good phone numbers" do
        it {should allow_value("97477155015").for(:phone)}
    end
    describe "Rejectss bad phone numbers" do
        it {should_not allow_value("800-EAT-FOOD").for(:phone)}
    end
    describe "Validates good country" do
        it {should allow_value("Qatar").for(:country)}
    end
    describe "All factories are properly created" do
        before(:each) do
            @talal = FactoryGirl.create(:user)
            @srinjoy = FactoryGirl.create(:user, :first_name => "Srinjoy", :last_name => "Chakravarty")
            @nourhane = FactoryGirl.create(:user, :first_name => "Nourhane", :last_name => "Feki")
        end
        it "should check the creation of users" do
            @talal.should be_valid
            @srinjoy.should be_valid
            @nourhane.should be_valid
            @talal.first_name.should == "Talal"
            @srinjoy.first_name.should == "Srinjoy"
            @nourhane.first_name.should == "Nourhane"
        end
        it "should remove all + and . from phone before save" do
            @talal.phone.should == "97477155015"
        end

        it "should return the names in alphabetical order" do
            User.alphabetical.map{|o| o.first_name}.should == ["Nourhane", "Srinjoy", "Talal"]
        end
    end
end
