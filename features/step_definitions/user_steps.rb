Given /^an initial business$/ do
  @srinjoy = FactoryGirl.create(:owner, :firstname => "Srinjoy", :lastname => "Chakravarty")
end

Given /^I am on the 'New Owner' page$/ do
  visit new_owner_path
end
