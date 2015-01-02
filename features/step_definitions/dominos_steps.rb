Given(/^I visit the Dominos home page$/) do
  visit('https://order.dominos.com/en/')
end

When(/^I click the "(.*?)" tab$/) do |link|
  click_link(link, :match => :first)
end

When(/^I click the "(.*?)" radio button$/) do |orderType|
  contentType = '.' + orderType
  if page.has_content?(contentType) then
    find('.' + orderType).click
  end
#  click_button(orderType)
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
  sleep(2)
  case updatePizza
  when 'Extra Onion'
    selectPizzaOption = "(//input[@name='S_PIZSE|Topping|O'])[4]"
  when 'Extra Pepper'
    selectPizzaOption = "//input[@name='S_PIZSV|Topping|Si'][@value='1/1|1.5']"
  when 'Extra Sausage'
    selectPizzaOption = "//input[@name='S_PIZPT|Topping|Sb'][@value='1/1|1.5']"
  end
  find(:xpath, selectPizzaOption).click
end

Then(/^I should see the "(.*?)" page$/) do |pageName|
#  sleep(1)
  case pageName
  when 'Home'
    tempvar = 'homePage'
  when 'Specialty Pizza'
    tempvar = 'categoryPage2'
  when 'Entrees'
    tempvar = 'entreesPage'
  when 'Locations Search'
    sleep(2)
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
