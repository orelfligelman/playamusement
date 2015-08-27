require 'rubygems'
require 'capybara'
# require 'waitforajax'

session = Capybara::Session.new(:selenium)
# session.default_max_wait_time = 6 
session.visit "http://www.ebay.com"
	session.find_link('Sign in').click 
	# session.run_server 
	session.fill_in('userid', :with => 'orelmfligelman@gmail.com')
    session.fill_in('Password', :with => 'cafe2previous#')
    session.click_button('sgnBt')
    session.find_link('My eBay').hover		
    session.find_link('Selling').click
    session.find_link('leftnav_sell_an_item').click
    session.fill_in 'keywords', :with => 'Iphone 6'
    session.click_button('Get started')
     # Capybara.exact = true 
    session.choose('Cell Phones & Accessories > Cell Phones & Smartphones')
    session.find_link('Sell one like this', match: :first).click
    session.select('For parts or not working', :from => 'condition')
    # session.find_by_id('addPhotoLink').find_by_id('uLi').find_link('Add photos').click
    # session.find('fileForm').attach_file('/home/orel/Pictures/profilepicture.jpg') 
    # session.find_link('Go').clic
    session.find('mpn_is')
    session.find('contract_is').set('Without Contract')
    session.select('iOS - Apple', :from => 'Operating System')
    session.select('Bar', :from => 'Style')
    session.select('Network Locked', :from => 'Lock Status')
    session.fill_in 'startPrice', :with => '5175.00'
    session.click_button 'List It' 