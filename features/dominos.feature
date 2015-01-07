@OrderPizza
Feature: Order Dominos Pizza Online
  We want to step through a simple scenario for training

Background: 
  Given I visit the Dominos home page
  Then I should see the "Home" page 

@SetLocation
Scenario: Location serach for Dominos pizza
  When I click the "Locations" tab
  Then I should see the "Locations Search" page
  When I click the "Carryout" radio button
    And I enter the address as: 
| select | Address Type | House                       |
| enter  | Street       | 21208 Virginia Pine Terrace |
| enter  | City         | Germantown                  |
| select | State        | MD                          |
| enter  | Zip          | 20876                       |
    And I click the "Continue" button
  Then I should see the "Locations Results" page
  When I click the "Order Carryout / Pickup" tab
#  When I click the "Future Carryout Order" tab
  Then I should see the "Entrees" page

Scenario Outline: Add a pizza to the shopping cart
  When I click the "Order Online" tab
  Then I should see the "Entrees" page
  When I click the "Specialty Pizza" tab
  Then I should see the "Specialty Pizza" page
  When I click the "<pizzaName>" tab
  Then I should see the "<pizzaName>" builder page
  When I add "<option>" to the pizza
    And I click the "Add to Order" button
  Then I should see the "Specialty Pizza" page 
    And I should see the "<pizzaName>" pizza ordered

@SpinachFeta
Examples:
| pizzaName | option |
| Spinach & Feta | Extra Onion |

@Tuscany
Examples:
| pizzaName | option |
| Tuscan Salami & Roasted Veggie | Extra Pepper |

@SausagePepper
Examples:
| pizzaName | option |
| Italian Sausage & Pepper Trio | Extra Sausage |

@Custom1
Scenario: Order the first custom pizza
  When I click the "Order Online" tab
  Then I should see the "Entrees" page
  When I click the "Build Your Own Pizza" tab
  Then I should see the "Build Your Own Pizza" page
  When I add "X-Large (16") Brooklyn Pizza" to the pizza
  When I click the "Next Step" tab
  Then I should see the "Choose Cheese & Sauce" page
  When I add "Extra Cheese" to the pizza
    And I add "White Sauce" to the pizza
    And I click the "Next Step" tab
  Then I should see the "Choose Toppings" page
  When I check "Italian Sausage" to the pizza
    And I check "Mushrooms" to the pizza
    And I click the "Add to Order" button
    And I click the "No Thanks" button
  Then I should see the "Entrees" page
    And I should see the "X-Large (16") Brooklyn Pizza" pizza ordered

@Checkout
Scenario: Checkout the items
  When I click the "Order Online" tab
  Then I should see the "Entrees" page
  When I click the "Checkout" button
  Then I should see the "Checkout" page
  When I click the "Continue Checkout" tab
  Then I should see the "Donation" page
  When I click the "Yes, Add to Order" tab
  Then I should see the "Payment" page

