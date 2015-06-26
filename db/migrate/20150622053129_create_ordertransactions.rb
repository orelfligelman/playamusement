class CreateOrdertransactions < ActiveRecord::Migration
  def change
    create_table :ordertransactions do |t|

      t.timestamps null: false
    end
  end
end
