require 'rubygems'
require 'capybara'
session = Capybara::Session.new(:selenium)
session.visit "http://www.ebay.com"
# session.find_link('My eBay').visible?
	session.find_link('My eBay').click
	session.find_link('Selling').click 
    session.click('Sign in')		
