class AddBirthdayAndSuperBirthdayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :birthday, :boolean
    add_column :events, :super_birthday, :boolean
  end
end
