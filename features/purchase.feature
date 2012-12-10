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
					
					
					And for the "body", I should see a link to "Back"

				Scenario: Update Purchases
					Given I am on the 'purchases' page
					

				Scenario: Delete Purchases
					Given I am on the 'purchases' page
    				