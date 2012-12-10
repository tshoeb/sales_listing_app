Feature: User information
	In order to run a sales listing website
	As the administrator
	I want to be able to list, create, update, and delete user information

		Background:
			Given an initial business

				Scenario: List Users
					Given I am on the 'users' page
					Then for the "title", I should see "Shopping App | Users"
					And for the "th", I should see "First name"
					And for the "th", I should see "Last name"
					And for the "th", I should see "Email"
					And for the "th", I should see "Country"
					And for the "th", I should see "Phone"
					And for the "td", I should see "Talal"
					And for the "td", I should see "Shoeb"
					And for the "td", I should see "talal@cmu.edu"
					And for the "td", I should see "Qatar"
					And for the "td", I should see "97477155015"
					And for the "body", I should see "Listing users"
					And for the "body", I should see a link to "New User"

				Scenario: Create User
					Given I am on the 'new user' page
					Then for the "title", I should see "Shopping App | Sign up"
					When I enter "Alexander" for "First name"
					And I enter "Buttner" for "Last name"
					And I select "Cyprus" for "Country"
					And I enter "55566090897" for "Phone"
					And I enter "ab@hotmail.com" for "Email"
					And I enter "abc123" for "user_password"
					And I enter "abc123" for "user_password_confirmation"
					And I click on the button named "Create User"
					Then I should see "User was successfully created."
					And I should see "First name: Alexander"
					And I should see "Last name: Buttner"
					And I should see "Email: ab@hotmail.com"
					And I should see "Country: Cyprus"
					And I should see "Phone: 55566090897"
					And for the "body", I should see a link to "Back"

				Scenario: Update User
					Given I am on the 'users' page
					When I follow the "Edit" link for "Talal"
					Then for the "body", I should see a link to "Show"
					Then for the "body", I should see a link to "Back"
					And I change the email address to "robben@holland.com"
					And I enter "sri" for "user_password"
					And I enter "sri" for "user_password_confirmation"
					And I click the "Update" button
					Then I should see "User was successfully updated."
					And I should see "Email: robben@holland.com"

				Scenario: Delete User
					Given I am on the 'users' page
    				When I follow the "Destroy" link for "Talal"
    				Then I should not see "Talal"	