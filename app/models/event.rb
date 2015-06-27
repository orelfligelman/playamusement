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
	scope :full, -> {where('#maximum_events_reached')}
end
