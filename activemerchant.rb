  require 'active_merchant'
  require "active_merchant/billing/rails"
 # Send requests to the gateway's test servers
ActiveMerchant::Billing::Base.mode = :test

# Create a new credit card object
credit_card = ActiveMerchant::Billing::CreditCard.new(
  :number     => '4111111111111111',
  :month      => '8',
  :year       => '2009',
  :first_name => 'Tobias',
  :last_name  => 'Luetke',
  :verification_value  => '123'
)

if credit_card.valid?
  # Create a gateway object to the TrustCommerce service
  gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
    :login    => 'TestMerchant',
    :password => 'password'
  )

  # Authorize for $10 dollars (1000 cents)
  response = gateway.authorize(1000, credit_card)

  if response.success?
    # Capture the money
    gateway.capture(1000, response.authorization)
    puts "paid"
  else
    puts "not"
    raise StandardError, response.message
  end
else
  p  "not valid"
end