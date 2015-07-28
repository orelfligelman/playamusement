class AddColumnsToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :short_description, :string
    add_column :attractions, :long_description, :text
  end
end
