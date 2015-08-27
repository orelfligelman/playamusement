class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  require 'active_merchant'
  require "active_merchant/billing/rails"
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = OrderInformation.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = OrderInformation.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
   @order_information = OrderInformation.new(order_information_params)


    respond_to do |format|
      if @order_information.save
          if @order.process
        format.html { redirect_to @order_information, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        EmailWorker.perform_async(@order_information.id)
      else
        format.html { render :new }
        format.json { render json: @order_information.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order_information.update(order_information_params)
        format.html { redirect_to @order_information, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order_information.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order_information = OrderInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:new_cart_id, :first_name, :last_name, :card_type, :card_expires_on)
    end
  def pay
     # Send requests to the gateway's test servers
    ActiveMerchant::Billing::Base.mode = :test

    # Create a new credit card object
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number     => '4111111111111111',
      :month      => '8',
      :year       => '2009',
      :first_name => 'Tobias',
      :last_name  => 'Luetke',
      :verification_value  => '123'
    )

    if credit_card.valid?
      # Create a gateway object to the TrustCommerce service
      gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
        :login    => 'TestMerchant',
        :password => 'password'
      )

      # Authorize for $10 dollars (1000 cents)
      response = gateway.authorize(1000, credit_card)

      if response.success?
        # Capture the money
        gateway.capture(1000, response.authorization)
        puts "paid"
      else
        puts "not"
        raise StandardError, response.message
      end
    else
      p  "not valid"
    end
end
