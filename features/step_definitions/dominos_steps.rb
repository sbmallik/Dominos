When(/^I visit the Dominos home page$/) do
  visit('https://order.dominos.com/')
#  visit('http://www.usatoday.com/') #  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the Dominos home page$/) do
  expect(page).to have_selector(:id, 'homePage')
#  expect(page).to have_selector(:id, 'section_home') # pending # express the regexp above with the code you wish you had
end

When(/^I click the "(.*?)" tab$/) do |tab|
  click_link('Locations')
end

Then(/^I should see the Dominos Location Search page$/) do
  sleep(5)
  expect(page).to have_selector(:id, 'locationsSearchPage')
end

When(/^I enter the Street name$/) do 
  fill_in('Street', :with => '21208 Virginia Pine Terrace')
end

When(/^I enter the City name$/) do
  fill_in('City', :with => 'Germantown')
end

When(/^I select the State name$/) do
  select('MD', :from => 'State')
end

When(/^I enter the Zip Code$/) do
  fill_in('Zip', :with => '21208')
end

When(/^I click the Search Locations button$/) do
  find('.btn--large').click
end

Then(/^I should see the Dominos Location Results page$/) do
  sleep(5)
  expect(page).to have_selector(:id, 'locationsResultsPage')
end

