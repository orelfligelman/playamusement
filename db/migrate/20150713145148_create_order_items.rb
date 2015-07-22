class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :eventpackages
      t.references :order_information
      t.float :unit_price
      t.integer :quantity
      t.float :total_price

      t.timestamps null: false
    end
  end
end
