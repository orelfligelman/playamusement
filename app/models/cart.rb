class Cart < ActiveRecord::Base
	#associations
	has_one :order
	belongs_to :user
	has_many :pictures, as: :imageable
end
