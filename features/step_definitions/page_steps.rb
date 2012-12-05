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


























