class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :summary
      t.string :location
      t.string :description
      t.datetime :start_date
      t.string :timezone
      t.datetime :end_date
      t.string :attendees

      t.timestamps null: false
    end
  end
end
