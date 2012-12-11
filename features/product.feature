Feature: Product information
	In order to sell products via the website 
	As a user
	I want to be able to list, create, update, and delete product information

		Background:
			Given an initial business

				Scenario: List Products
					Given I am on the 'products' page
					And for the "th", I should see "Name"
					And for the "th", I should see "Price"
					And for the "th", I should see "Description"
					And for the "th", I should see "Color"
					And for the "th", I should see "Brand"
					And for the "th", I should see "Fragile"
					And for the "th", I should see "Available"
					And for the "th", I should see "Expiry date"
					
					And for the "td", I should see "iPhone"
					And for the "td", I should see "5000 Riyals"
					And for the "td", I should see "abc"
					And for the "td", I should see "White"
					And for the "td", I should see "Apple"
					And for the "td", I should see "true"
					And for the "td", I should see "true"
					And for the "body", I should see "Listing products"
					And for the "body", I should see a link to "New Product"
					
				Scenario: Create Product
					Given I am on the 'new product' page
					
					

				Scenario: Update Products
					Given I am on the 'products' page
					When I blindly follow the "Edit" link for "iPhone"
					Then for the "body", I should see a link to "Show"
					Then for the "body", I should see a link to "Back"
					And I change the price to "4000 Riyals"
					And I click the "Update" button
					Then I should see "Product was successfully updated."
					And I should see "Price: 4000 Riyals"
				

				Scenario: Delete Products
					Given I am on the 'products' page
    				When I blindly follow the "Destroy" link for "iPhone"
    				Then I should not see "iPhone"	