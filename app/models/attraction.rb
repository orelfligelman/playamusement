class Attraction < ActiveRecord::Base
	#associations 
	belongs_to :event 
	has_many :pictures, as: :imageable
	#rename to package

 # <div class="field">
 #    <%= f.label :package %><br>
 #    <%= f.select :package [["Birthday"], ["Super Birthday"]] %>
 #  </div>

end