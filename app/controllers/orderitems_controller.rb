class OrderitemsController < ApplicationController
  before_action :set_orderitem, only: [:show, :edit, :update, :destroy]

  # GET /orderitems
  def index
    @orderitems = Orderitem.all
  end

  # GET /orderitems/1
  def show
  end

  # GET /orderitems/new
  def new
    @orderitem = Orderitem.new
  end

  # GET /orderitems/1/edit
  def edit
  end

  # POST /orderitems
  def create
    @orderitem = Orderitem.new(orderitem_params)

    if @orderitem.save
      redirect_to @orderitem, notice: 'Orderitem was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orderitems/1
  def update
    if @orderitem.update(orderitem_params)
      redirect_to @orderitem, notice: 'Orderitem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orderitems/1
  def destroy
    @orderitem.destroy
    redirect_to orderitems_url, notice: 'Orderitem was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderitem
      @orderitem = Orderitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def orderitem_params
      params.require(:orderitem).permit(:order_id, :saleproduct_id, :category_id, :quantity, :item_price, :total_price)
    end
end
