class DropAttractionsColumns < ActiveRecord::Migration
  def change
remove_column :attractions, :ballocity 
remove_column :attractions, :bumper_cars
remove_column :attractions, :carousel
remove_column :attractions, :himalaya
remove_column :attractions, :inflatabales
remove_column :attractions, :lazer
remove_column :attractions, :runner
remove_column :attractions,  :soft_play   
remove_column :attractions,  :arcade  
  end
end
