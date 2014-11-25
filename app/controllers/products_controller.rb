class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]
  

  # GET /products
  def index
    # @product_groups = @products.group_by { |t| t.meat }
    @products_by_category = Product.all.group_by { |t| t.category_id }
end

  # GET /products/1
  def show
   @productitems = Productitem.where(:product_id => @product.id)
   #for @productitems.each do |productitem|
    # if productitem.volume.blank?
    #   a = Baseproduct.where(:ingredient_id => productitem.ingredient_id).sort_by { |h| h[:purchase_date]}.reverse
   	#  productitem.update(:volume => (a.first.unit_weight*productitem.unit_count))
    #  end
 	  #end 
      @friendships = Friendship.where(:product_id => @product.id)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end
  #  if @product.productitems.any?
  #    else
  #      1.times { @product.productitems.build }
  #  end
  #   if @product.friendships.any?
  #      else
  #        1.times { @product.friendships.build(:product_id => @product) }
  #    end
  

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)

      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:id, :name, :desc, :category_id, productitems_attributes:[:_destroy, :id, :product_id, :category_id, :ingredient_id, :volume, :unit_count, :price_selector], friendships_attributes:[:_destroy, :id, :friend_id, :product_id, :prodvolume])
    end
    
end
