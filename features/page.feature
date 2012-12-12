Feature: Standard Business
  
  As a user
  I want to be able to view certain information
  So I can have confidence in the system

    Scenario: Homepage
      Given I am on the home page
      Then I should see "Welcome to our homepage!"
      And I should see "The most convenient sales listing application in town!"
      And I should see a button named "Sign up now!"
      And I should see a button named "Log in"
     

    Scenario: Do not see the default rails page
      Given I am on the home page
      Then I should not see "You're riding Ruby on Rails!"
      And I should not see "About your application's environment"
      And I should not see "Create your database"  

    Scenario: View Page links information in header
      Given I am on the home page
      Then "About Us" should be part of the "header"
      And "Contact Us" should be part of the "header"
      And "Privacy Policy" should be part of the "header"     

    Scenario: View webmaster information in footer
      Given I am on the home page
      Then "Webmaster: Chakravarty | al-Ahmed © 2013" should be part of the "footer"

    Scenario: Functionality of Sign-up button
      Given I am on the home page
      When I click on the button named "Sign up now!"
      Then I should navigate to the "New user" page
    

    Scenario: Functionality of Log In button
      Given I am on the home page
      When I click on the button named "Log in"
      Then I should navigate to the "Log in" page
    

    Scenario: View 'About Us'
      Given I am on the home page
      When I follow the "About Us" link
      Then I should see "About us"
      And I should see "Create your online store"

    Scenario: View 'Contact Us'
      Given I am on the home page
      When I follow the "Contact Us" link
      Then I should see "Contact info"
      And I should see "For account questions and customer service:"

    Scenario: View 'Privacy Policy'
      Given I am on the home page
      When I follow the "Privacy Policy" link
      Then I should see "Privacy Settings" 
      And I should see "TERMS OF WEBSITE USE"  