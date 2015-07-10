class Event < ActiveRecord::Base
	#associations 
	has_one :packages
	accepts_nested_attributes_for :packages, allow_destroy: true
	has_many :orders
	accepts_nested_attributes_for :orders, allow_destroy: true 
	has_many :attractions
	has_many :pictures, as: :imageable
	accepts_nested_attributes_for :attractions, allow_destroy: true
	accepts_nested_attributes_for :pictures, allow_destroy: true

	#scopes
	scope :paid, -> {where('paid' == true)}
	scope :unpaid, -> {where('paid' == false)}
	scope :past_thirty_days, -> (date) {where('start_date' > ?', 1.week.ago)}
		#Event.past_thirty_days(Date.today)		
	#validations



	#before event is saved, it must be paid for 
	#boolean for paid is meant so that in the case where the user would like to make a reservation and pay for it later, we might hold it for him
	def must_pay_to_avoid_cancellation
		if @event.start_date < (Time.now + 1.week) && @event.paid == false 
			#cannot book event
		end
	end

	def calculate_price
	end 

end 