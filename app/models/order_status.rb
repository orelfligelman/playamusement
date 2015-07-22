class OrderStatus < ActiveRecord::Base
	has_many :orderinformations
end
