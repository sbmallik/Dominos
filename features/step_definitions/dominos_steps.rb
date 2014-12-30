Given(/^I visit the Dominos home page$/) do
  visit('https://order.dominos.com/en/')
end

#Given(/^I am on the Dominos Home page$/) do
#  expect(page).to have_selector(:id, 'homePage')
#end

#Given(/^I am on the Entrees page$/) do
#  visit('https://order.dominos.com/en/')
#  click_link('Order Online')
#  sleep(3)
#  expect(page).to have_selector(:id, 'entreesPage')
#end

When(/^I click the "(.*?)" tab$/) do |link|
  click_link(link, :match => :first)
end

#Then(/^I should see the Dominos Location Search page$/) do
#  sleep(3)
#  expect(page).to have_selector(:id, 'locationsSearchPage')
#end

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

#When(/^I "(.*?)" the "(.*?)" as "(.*?)"$/) do |arg1, arg2, arg3|
#case arg1
#when 'select'
#  select(arg3, :from => arg2)
#when 'enter'
#  fill_in(arg2, :with => arg3)
#end
#end

#When(/^I enter the "(.*?)" as "(.*?)"$/) do |arg1, arg2| 
#  fill_in(arg2, :with => arg3)
#end

When(/^I click the "(.*?)" button$/) do |btnName|
case btnName
  when 'Checkout'
    tempvar2 = '.btn--checkout'
    find(tempvar2).click
#  when 'Continue'
#    if page.has_button?('Continue') then
#      click_button('Continue')
#    else
#      click_button('Search Locations')
#    end
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
  sleep(5)
  case updatePizza
  when 'Extra Spinach'
    selectPizzaOption = '/html/body/div[20]/div/div[2]/div/div[2]/form/div[2]/div[2]/div[2]/div/div/div[2]/div[3]/div[5]/input'
  when 'Extra Pepper'
    selectPizzaOption = '/html/body/div[20]/div/div[2]/div/div[2]/form/div[2]/div[2]/div[2]/div/div/div[2]/div[4]/div[5]/input'
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

#When(/^I click the First occurrence of Order Carryout Pickup button$/) do
#  first('.js-orderCarryoutNow').click
#end

#Then(/^I should see the Entrees page$/) do
#  expect(page).to have_selector(:id, 'entreesPage')
#end

#Then(/^I should see the Specialty Pizza page$/) do
#  expect(page).to have_selector(:id, 'categoryPage2')
#end

Then(/^I should see the "(.*?)" builder page$/) do |pizzaName|
#  sleep(1)
  expect(page).to have_selector('h2', pizzaName)
end

Then(/^I should see the "(.*?)" pizza ordered$/) do |pizzaName|
#  sleep(1)
  expect(page).to have_selector('a', pizzaName)
end
