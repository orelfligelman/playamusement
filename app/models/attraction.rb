class Attraction < ActiveRecord::Base
	#associations 
	belongs_to :event 
	has_many :pictures, as: :imageable
	#rename to package

	#scopes 


end