class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
   before_action :signed_in_user, only: [:index]
   respond_to :html, :json

  def dothat
  @order = Order.create(status: "Open", total: 0, date_selector: "Select a date")
      @order.save
  
       n = Saleproduct.where(:status => "Live").count
       @saleproduct = Saleproduct.where(:status => "Live").pluck(:id)
       while n> 0 do
         Orderitem.create(:order_id => @order.id, :saleproduct_id => @saleproduct[n-1], :quantity => 0 ).save
         n = n-1
       end
     redirect_to edit_new_order_path(guid: @order.guid)
   end
  
  # GET /orders
  def index
    # @orders = Order.all
    @orders_by_status = Order.all.group_by { |t| t.status }   
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    n = Saleproduct.all.count
    Rails.logger.debug("n is: #{n.inspect}")
    n.times do # Testing with n empty rows
          @order.orderitems.build
        end
     @saleproducts = Saleproduct.all
  end

  # GET /orders/1/edit
  def edit
     @saleproducts = Saleproduct.all.order(id: :desc)
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
      if @order.update(order_params)
       redirect_to @order, notice: 'Please review your order and personal details before making payment.'
      else
        render :edit
      end
   
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by!(
      guid: params[:guid]
    )
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:collection_date, :contact_person, :marketing, :phone, :email, :status, :date_selector, :guid, :stripe_id, :total, :permalink, orderitems_attributes:[:_destroy, :id, :order_id, :saleproduct_id, :quantity, :item_price, :total_price])
    end 
    
end