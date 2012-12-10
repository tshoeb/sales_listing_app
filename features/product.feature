Feature: Product information
	In order to sell products via the website 
	As a user
	I want to be able to list, create, update, and delete product information

		Background:
			Given an initial business

				Scenario: List Purchases
					Given I am on the 'products' page
					And for the "th", I should see "User"
					And for the "th", I should see "Name"
					And for the "th", I should see "Price"
					And for the "th", I should see "Description"
					And for the "th", I should see "Color"
					And for the "td", I should see "Brand"
					And for the "td", I should see "Shoeb"
					And for the "td", I should see "talal@cmu.edu"
					And for the "td", I should see "Qatar"
					And for the "td", I should see "97477155015"
					And for the "body", I should see "Listing users"
					And for the "body", I should see a link to "New User"
					
				Scenario: Create Purchase
					Given I am on the 'new product' page
					
					

				Scenario: Update Purchase
					Given I am on the 'products' page
				

				Scenario: Delete Purchase
					Given I am on the 'products' page
    				