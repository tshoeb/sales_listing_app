Given /^an initial business$/ do
  @talal = FactoryGirl.create(:user)
  @srinjoy = FactoryGirl.create(:user, :first_name => "Srinjoy", :last_name => "Chakravarty", :country => "India", :email => "chaxz@cmu.edu", :phone => "97455641191", :password => "hi", :password_confirmation => "hi")
  @iPhone = FactoryGirl.create(:product, :user => @srinjoy)
  #@srinjoypurchase = FactoryGirl.create(:purchase)
end

Given /^I am on the home page$/ do
  visit root_path
end

When /^I go to the about page$/ do
  visit about_path
end

When /^I go to the contact page$/ do
  visit contact_path
end

When /^I go to the privacy page$/ do
  visit privacy_path
end

Then /^I should see "(.*?)"$/ do |message|
  page.should have_content message
end

Then /^I should see a button named "(.*?)"$/ do |button|
  page.has_button?(button)
end

Then /^the "(.*?)" of the page should be "(.*?)"$/ do |html_tag, title_text|
  page.should have_selector(html_tag, :text => title_text)
end

When /^I click on the button named "(.*?)"$/ do |click_button|
  click_on(click_button)
end

Then /^I should navigate to the "(.*?)" page$/ do |target_page|
  page.should have_content target_page
end

When /^I follow the "(.*?)" link$/ do |link|
  click_link link
end

Then /^I should not see "(.*?)"$/ do |msg|
  page.should_not have_content msg
end

Then /^"(.*?)" should be part of the "(.*?)"$/ do |txt, tag|
  page.should have_selector(tag, :text => txt)
end

Given /^I am on the 'users' page$/ do
  visit users_path
end

Then /^for the "(.*?)", I should see "(.*?)"$/ do |csstag, textvalue|
  page.should have_css(csstag, :text => textvalue)
end

Then /^for the "(.*?)", I should see a link to "(.*?)"$/ do |csstag, textvalue|
  within csstag do
    page.should have_link textvalue
  end
end

Given /^I am on the 'new user' page$/ do
  visit new_user_path
end

When /^I enter "(.*?)" for "(.*?)"$/ do |value, field|
  fill_in field, :with => value
end

When /^I select "(.*?)" for "(.*?)"$/ do |value, field|
  select value, :from => field
end

When /^I follow the "(.*?)" link for "(.*?)"$/ do |crud_link, cell_value|
  within_table('User List') do
    within('tr', :text => cell_value) do
      find('a', :text => crud_link).click
    end
  end    
end

When /^I blindly follow the "(.*?)" link for "(.*?)"$/ do |crud_link, cell_value|
  within_table('Product List') do
    within('tr', :text => cell_value) do
      find('a', :text => crud_link).click
    end
  end    
end


When /^I change the email address to "(.*?)"$/ do |new_email|
  fill_in "Email", :with => new_email
end

When /^I click the "(.*?)" button$/ do |button_name|
  click_button button_name
end

Given /^I am on the 'purchases' page$/ do
  visit purchases_path
end

Given /^I am on the 'products' page$/ do
  visit products_path
end

Then /^I change the price to "(.*?)"$/ do |new_price|
  fill_in "Price", :with => new_price
end








































