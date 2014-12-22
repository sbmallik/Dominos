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
  find('.' + orderType).click
#  click_button(orderType)
end

When(/^I select the "(.*?)" as "(.*?)"$/) do |arg1, arg2|
  select(arg2, :from => arg1)
end

When(/^I enter the "(.*?)" as "(.*?)"$/) do |arg1, arg2| 
  fill_in(arg1, :with => arg2)
end

When(/^I click the "(.*?)" button$/) do |btnName|
#  find('.btn--large').click
  click_button(btnName)
end

Then(/^I should see the "(.*?)" page$/) do |pageName|
  sleep(1)
  case pageName
  when 'Home'
    tempvar = 'homePage'
  when 'Specialty Pizza'
    tempvar = 'categoryPage2'
  when 'Entrees'
    tempvar = 'entreesPage'
  when 'Locations Search'
    sleep(10)
    tempvar = 'locationsSearchPage'
  when 'Locations Results'
    tempvar = 'locationsResultsPage'
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
  expect(page).to have_selector('h2', pizzaName)
end

Then(/^I should see the "(.*?)" pizza ordered$/) do |pizzaName|
  sleep(2)
  expect(page).to have_selector('a', pizzaName)
end
