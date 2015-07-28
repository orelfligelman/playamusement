class AddAvatarToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :avatar, :string
  end
end
