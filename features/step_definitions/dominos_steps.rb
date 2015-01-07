Given(/^I visit the Dominos home page$/) do
  visit('https://order.dominos.com/en/')
end

When(/^I click the "(.*?)" tab$/) do |link|
if page.has_no_link?(link) then
  if link == 'Order Carryout / Pickup' then
    link = 'Future Carryout Order'
  end
end
click_link(link, :match => :first)
end

When(/^I click the "(.*?)" radio button$/) do |orderType|
#  find('.' + orderType).click
#  click_button(orderType)
xpathElement = "//div[@class='form']//label[.='#{orderType}']"
if page.has_xpath?(xpathElement) then
  find(:xpath, xpathElement).click
end
end

When(/^I enter the address as:$/) do |table|
table.raw.each do |x|
  case x[0]
  when 'select';    select(x[2], :from => x[1])
  when 'enter';    fill_in(x[1], :with => x[2])
  end
end
end

When(/^I click the "(.*?)" button$/) do |btnName|
case btnName
  when 'Order Pizza'
    tempvar3 = "//div[@id='pizzaSummaryInColumn']/div[2]/div[2]/button"
    find(:xpath, tempvar3).click
  when 'Checkout'
    tempvar2 = '.btn--checkout'
    find(tempvar2).click
  else
    if page.has_no_button?(btnName) then
      if (btnName == 'Continue') then
        btnName = 'Search Locations'
      end
    end
#    find('.btn--large').click
    click_button(btnName)
  end
end

When(/^I add "(.*?)" to the pizza$/) do |updatePizza|
  sleep(1)
  case updatePizza
  when 'Extra Onion'
    selectPizzaOption = "(//input[@name='S_PIZSE|Topping|O'])[4]"
  when 'Extra Pepper'
    selectPizzaOption = "//input[@name='S_PIZSV|Topping|Si'][@value='1/1|1.5']"
  when 'Extra Sausage'
    selectPizzaOption = "//input[@name='S_PIZPT|Topping|Sb'][@value='1/1|1.5']"
  when 'X-Large (16") Brooklyn Pizza'
    selectPizzaOption = "//input[@value='P16IBKZA']"
  when 'White Sauce'
    selectPizzaOption = "//input[@name='S_PIZZA|Topping|Xw']"
  when 'Extra Cheese'
    selectPizzaOption = "//select[@name='Weight|C--1']/option[4]"
  end
  find(:xpath, selectPizzaOption).click
end

When(/^I check "(.*?)" to the pizza$/) do |topping|
  sleep(1)
  check(topping)
end

Then(/^I should see the "(.*?)" page$/) do |pageName|
#  sleep(1)
  case pageName
  when 'Home'
    tempvar = 'homePage'
  when 'Specialty Pizza'
    tempvar = 'categoryPage2'
  when 'Build Your Own Pizza'
    tempvar = 'pizzaBuilderPage'
  when 'Choose Cheese & Sauce'
    tempvar = 'cheeseSauceWrapper'
  when 'Choose Toppings'
    tempvar = 'toppingsWrapper'
  when 'Entrees'
    tempvar = 'entreesPage'
  when 'Locations Search'
#    sleep(1)
    tempvar = 'locationsSearchPage'
  when 'Locations Results'
    tempvar = 'locationsResultsPage'
  when 'Checkout'
    tempvar = 'orderCheckoutPage'
  when 'Donation'
    tempvar = 'genericOverlay'
  when 'Payment'
    tempvar = 'orderPaymentPage'
  end
  expect(page).to have_selector(:id, tempvar)
end

Then(/^I should see the "(.*?)" builder page$/) do |pizzaName|
#  sleep(1)
  expect(page).to have_selector('h2', pizzaName)
end

Then(/^I should see the "(.*?)" pizza ordered$/) do |pizzaName|
#  sleep(1)
  expect(page).to have_selector('a', pizzaName)
end
