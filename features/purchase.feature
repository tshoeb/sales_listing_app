Feature: Purchase information
	In order to purchase from a sales listing website
	As a user
	I want to be able to list, create, update, and delete purchase information

		Background:
			Given an initial business

				Scenario: List Purchases
					Given I am on the 'purchases' page
					
					And for the "th", I should see "User"
					And for the "th", I should see "Product"
					And for the "th", I should see "Purchase date"
					And for the "th", I should see "Delivery date"
					And for the "td", I should see "1"
					And for the "td", I should see "1"
					And for the "td", I should see "5.days.ago"
					And for the "td", I should see "2.days.ago"
					And for the "body", I should see "Listing purchases"
					And for the "body", I should see a link to "New Purchase"

				Scenario: Create Purchase
					Given I am on the 'new purchase' page
					
					When I enter "1" for "User"
					And I select "iPhone" for "Product"
					And I select "2012" for "purchase_purchase_date_1i"
					And I select "December" for "purchase_purchase_date_2i"
					And I select "6" for "purchase_purchase_date_3i"
					And I select "2012" for "purchase_delivery_date_1i"
					And I select "December" for "purchase_delivery_date_2i"
					And I select "9" for "purchase_delivery_date_3i"
					And I click on the button named "Create Purchase"
					Then I should see "Purchase was successfully created."
					And I should see "First name: Alexander"
					And I should see "Last name: Buttner"
					And I should see "Email: ab@hotmail.com"
					And I should see "Country: Cyprus"
					And I should see "Phone: 55566090897"
					And for the "body", I should see a link to "Back"

				Scenario: Update Purchase
					Given I am on the 'purchases' page
					When I follow the "Edit" link for "Talal"
					Then for the "body", I should see a link to "Show"
					Then for the "body", I should see a link to "Back"
					And I change the email address to "robben@holland.com"
					And I enter "sri" for "user_password"
					And I enter "sri" for "user_password_confirmation"
					And I click the "Update" button
					Then I should see "User was successfully updated."
					And I should see "Email: robben@holland.com"

				Scenario: Delete Purchase
					Given I am on the 'purchases' page
    				When I follow the "Destroy" link for "Talal"
    				Then I should not see "Talal"	