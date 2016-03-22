class PurchaseHistoricsController < ApplicationController
  before_action :set_purchase_historic, only: [:show, :edit, :update, :destroy]

  # GET /purchase_historics
  # GET /purchase_historics.json
  def index
    @purchase_historics = PurchaseHistoric.all
  end

  # GET /purchase_historics/1
  # GET /purchase_historics/1.json
  def show
  end

  # GET /purchase_historics/new
  def new
    @purchase_historic  = PurchaseHistoric.new
    @purchase_historic.clienteAll =  Client.all.map { |c| [c.name, c.id] }
    @purchase_historic.productAll = Product.all.map { |c| [c.name, c.id] } 
  end

  # GET /purchase_historics/1/edit
  def edit
  end

  # POST /purchase_historics
  # POST /purchase_historics.json
  def create
    @purchase_historic = PurchaseHistoric.new(purchase_historic_params)
    @product = venda()

    respond_to do |format|
      if @product.quantity >= 0
        if @purchase_historic.save and @product.update_attribute(:quantity ,@product.quantity)
          format.html { redirect_to @purchase_historic, notice: 'Venda realizada com sucesso' }
          format.json { render :show, status: :created, location: @purchase_historic }
        else          
          format.html { render :new }
          format.json { render json: @purchase_historic.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @purchase_historic, notice: 'Não foi possivel realizar a venda pois não possui tantos produtos no estoque' }
        format.html { render :new }
        format.json { render json: @purchase_historic.errors, status: :unprocessable_entity }
      end
    end
  end

  def venda
    @product = Product.find(@purchase_historic.product_id)
    @product = saldoQuantidadeProduto()
    @purchase_historic.value_of_sell = (@purchase_historic.quantity * @product.value)
    return @product
  end

  def saldoQuantidadeProduto     
    @product.quantity = @product.quantity - @purchase_historic.quantity
    return @product
  end

  # PATCH/PUT /purchase_historics/1
  # PATCH/PUT /purchase_historics/1.json
  def update
    respond_to do |format|
      if @purchase_historic.update(purchase_historic_params)
        format.html { redirect_to @purchase_historic, notice: 'Venda atualizada com sucesso' }
        format.json { render :show, status: :ok, location: @purchase_historic }
      else
        format.html { render :edit }
        format.json { render json: @purchase_historic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_historics/1
  # DELETE /purchase_historics/1.json
  def destroy
    @purchase_historic.destroy
    respond_to do |format|
      format.html { redirect_to purchase_historics_url, notice: 'Venda cancelada com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_historic
      @purchase_historic = PurchaseHistoric.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_historic_params
      params.require(:purchase_historic).permit(:client_id, :product_id, :quantity, :createDate, :paidStatus, :discount)
    end
end
