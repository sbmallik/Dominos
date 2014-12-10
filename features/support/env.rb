require 'rspec/expectations'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'timeout'
 
# Using the Selenium driver as default so we can pop-open Firefox and get a
# good warm fuzzy feeling
     
Capybara.default_driver = :selenium
