class AddPaidColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :paid, :boolean
  end
end
