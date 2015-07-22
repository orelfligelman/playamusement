class EventpackageController < ApplicationController
  def index
  	@eventpackage = Eventpackage.all 
  	@order_item = current_order_information.order_items.new
  end
end
