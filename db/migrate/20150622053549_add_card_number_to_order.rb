class AddCardNumberToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :card_number, :integer
  end
end
