class EventsHasManyPackages < ActiveRecord::Migration
  def change 
  	add_foreign_key: :packages do |t|
  	t.belongs_to :events, index: true
  end
end
