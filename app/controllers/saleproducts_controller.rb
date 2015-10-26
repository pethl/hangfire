class SaleproductsController < ApplicationController
  before_action :set_saleproduct, only: [:show, :edit, :update, :destroy]
   before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]

   def import
        Saleproduct.import(params[:file])
        redirect_to saleproducts_path, notice: "Products imported."
      end
  
  
  # GET /saleproducts
  def index
    @saleproducts = Saleproduct.all
    @saleproducts_by_category_id = @saleproducts.group_by { |h| h[:category_id]}  
  end

  # GET /saleproducts/1
  def show
  end

  # GET /saleproducts/new
  def new
    @saleproduct = Saleproduct.new
  end

  # GET /saleproducts/1/edit
  def edit
  end

  # POST /saleproducts
  def create
    @saleproduct = Saleproduct.new(saleproduct_params)

    if @saleproduct.save
      redirect_to @saleproduct, notice: 'Saleproduct was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /saleproducts/1
  def update
    if @saleproduct.update(saleproduct_params)
      redirect_to @saleproduct, notice: 'Saleproduct was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /saleproducts/1
  def destroy
    @saleproduct.destroy
    redirect_to saleproducts_url, notice: 'Saleproduct was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saleproduct
      @saleproduct = Saleproduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def saleproduct_params
      params.require(:saleproduct).permit(:name, :stock_quantity, :remaining_quanity, :price, :weight, :category_id, :status)
    end
end
