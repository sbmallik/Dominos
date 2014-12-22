@OrderPizza
Feature: Order Dominos Pizza Online
  We want to step through a simple scenario for training

Background: 
  Given I visit the Dominos home page
  Then I should see the "Home" page 

@SetLocation @SpinachFeta 
Scenario: Location serach for Dominos pizza
  When I click the "Locations" tab
  Then I should see the "Locations Search" page
  When I click the "Carryout" radio button
    And I select the "Address Type" as "House"
#  When I select the Address Type as "House"
    And I enter the "Street" as "21208 Virginia Pine Terrace"
    And I enter the "City" as "Germantown"
    And I select the "State" as "MD"
    And I enter the "Zip" as "20876"
    And I click the "Continue" button
  Then I should see the "Locations Results" page
#  When I click the "Order Carryout / Pickup" tab
  When I click the "Future Carryout Order" tab
  Then I should see the "Entrees" page

@SpinachFeta
Scenario: Add a pizza to the shopping cart
  When I click the "Order Online" tab
  Then I should see the "Entrees" page
  When I click the "Specialty Pizza" tab
  Then I should see the "Specialty Pizza" page
  When I click the "Spinach & Feta" tab
  Then I should see the "Spinach & Feta" builder page
  When I click the "Add to Order" button
  Then I should see the "Specialty Pizza" page 
    And I should see the "Spinach & Feta" pizza ordered
