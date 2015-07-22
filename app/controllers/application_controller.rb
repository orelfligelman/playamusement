class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  # before_action :authenticate_user!
  #in case a user accesses a resource he is not authorized to
   rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
  
  def current_order
    if !session[:orderinform_id].nil?
      OrderInformation.find(session[:order_id])
    else
      Order.new
    end
  end
end
