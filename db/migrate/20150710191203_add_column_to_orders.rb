class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :active, :boolean
  end
end
