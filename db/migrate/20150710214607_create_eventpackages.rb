class CreateEventpackages < ActiveRecord::Migration
  def change
    create_table :eventpackages do |t|
      t.string :name
      t.float :price

      t.timestamps null: false
    end
  end
end
