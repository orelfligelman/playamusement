class AddPackageTypeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :package, :string
  end
end
