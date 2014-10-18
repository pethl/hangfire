class BaseproductsController < ApplicationController
  before_action :set_baseproduct, only: [:show, :edit, :update, :destroy]

  # GET /baseproducts
  def index
    @baseproducts = Baseproduct.all
  end

  # GET /baseproducts/1
  def show
  end

  # GET /baseproducts/new
  def new
    @baseproduct = Baseproduct.new
  end

  # GET /baseproducts/1/edit
  def edit
  end

  # POST /baseproducts
  def create
    @baseproduct = Baseproduct.new(baseproduct_params)

    if @baseproduct.save
      redirect_to @baseproduct, notice: 'Baseproduct was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /baseproducts/1
  def update
    if @baseproduct.update(baseproduct_params)
      redirect_to @baseproduct, notice: 'Baseproduct was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /baseproducts/1
  def destroy
    @baseproduct.destroy
    redirect_to baseproducts_url, notice: 'Baseproduct was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baseproduct
      @baseproduct = Baseproduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def baseproduct_params
      params.require(:baseproduct).permit(:name, :purchase_date, :unit_weight, :total_weight, :unit_count, :total_price, :unit_price, :price_per, :ingredient_id, :vendor_id)
    end
end
