class AddColumnToEventpackage < ActiveRecord::Migration
  def change
    add_column :eventpackages, :active, :boolean
  end
end
