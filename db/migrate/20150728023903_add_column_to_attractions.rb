class AddColumnToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :name, :string
    add_column :attractions, :price, :float
    add_column :attractions, :agelimit, :integer
  end
end
