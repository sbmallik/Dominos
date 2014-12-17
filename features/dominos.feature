Feature: Order Dominos Pizza Online
  We want to step through a simple scenario for training
 
Scenario: Check the Dominos home page
  When I visit the Dominos home page
  Then I should see the Dominos home page
 
Scenario: Location serach for Dominos pizza
  Given I visit the Dominos home page
  When I click the "Locations" tab
  Then I should see the Dominos Location Search page
  When I enter the Street name
    And I enter the City name
    And I select the State name
    And I enter the Zip Code
    And I click the Search Locations button
  Then I should see the Dominos Location Results page
