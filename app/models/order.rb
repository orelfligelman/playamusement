class Order < ActiveRecord::Base
  require "active_merchant/billing/rails"
	#associations
	belongs_to :cart
  belongs_to :event
	has_many :transactions, :class_name => "OrderTransaction"
	has_many :pictures, as: :imageable
	# check proper syntax for after_create validations e
	after_create :validate_card

def process
      response = GATEWAY.authorize(1 * 100, credit_card)
      if response.success?
        transaction = GATEWAY.capture(amount * 100, response.authorization)
        if !transaction.success?
          errors.add(:base, "The credit card you provided was declined.  Please double check your information and try again.") and return
          false
        end
        update_columns({authorization_code: transaction.authorization, success: true})
        true
      else
        errors.add(:base, "The credit card you provided was declined.  Please double check your information and try again.") and return
        false
      end
end


# def price_in_cents
#     (cart.total_price*100).round
#  end

  private
  
  def purchase_options
    {
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        # errors.add_to_base message
      end
    end
  end

  def credit_card
    @order ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      # :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end