class Attraction < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	#associations 
	belongs_to :event 
	has_many :pictures, as: :imageable
	#rename to package
	
	#scopes 


end