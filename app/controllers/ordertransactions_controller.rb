class OrdertransactionsController < ApplicationController
  before_action :set_ordertransaction, only: [:show, :edit, :update, :destroy]

  # GET /ordertransactions
  # GET /ordertransactions.json
  def index
    @ordertransactions = Ordertransaction.all
  end

  # GET /ordertransactions/1
  # GET /ordertransactions/1.json
  def show
  end

  # GET /ordertransactions/new
  def new
    @ordertransaction = Ordertransaction.new
  end

  # GET /ordertransactions/1/edit
  def edit
  end

  # POST /ordertransactions
  # POST /ordertransactions.json
  def create
    @ordertransaction = Ordertransaction.new(ordertransaction_params)

    respond_to do |format|
      if @ordertransaction.save
        format.html { redirect_to @ordertransaction, notice: 'Ordertransaction was successfully created.' }
        format.json { render :show, status: :created, location: @ordertransaction }
      else
        format.html { render :new }
        format.json { render json: @ordertransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordertransactions/1
  # PATCH/PUT /ordertransactions/1.json
  def update
    respond_to do |format|
      if @ordertransaction.update(ordertransaction_params)
        format.html { redirect_to @ordertransaction, notice: 'Ordertransaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordertransaction }
      else
        format.html { render :edit }
        format.json { render json: @ordertransaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordertransactions/1
  # DELETE /ordertransactions/1.json
  def destroy
    @ordertransaction.destroy
    respond_to do |format|
      format.html { redirect_to ordertransactions_url, notice: 'Ordertransaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordertransaction
      @ordertransaction = Ordertransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordertransaction_params
      params[:ordertransaction]
    end
end
