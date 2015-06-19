class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :bumper_cars
      t.string :arcade
      t.string :himalaya
      t.string :carousel
      t.string :ballocity
      t.string :lazer
      t.string :runner
      t.string :soft_play
      t.string :inflatabales

      t.timestamps null: false
    end
  end
end
