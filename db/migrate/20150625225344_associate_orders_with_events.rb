class AssociateOrdersWithEvents < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.belongs_to :events, index: true 
  	end
  end
end
