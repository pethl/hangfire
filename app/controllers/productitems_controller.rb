class ProductitemsController < ApplicationController
  before_action :set_productitem, only: [:show, :edit, :update, :destroy]

  

  # GET /productitems/1
  def show
  end

  # GET /productitems/new
  def new
    @productitem = Productitem.new
  end

  # GET /productitems/1/edit
  def edit
  end

  # POST /productitems
  def create
    @productitem = Productitem.new(productitem_params)

    if @productitem.save
      redirect_to @productitem, notice: 'Productitem was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /productitems/1
  def update
    if @productitem.update(productitem_params)
      redirect_to @productitem, notice: 'Productitem was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /productitems/1
  def destroy
    @productitem.destroy
    redirect_to productitems_url, notice: 'Productitem was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productitem
      @productitem = Productitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def productitem_params
      params.require(:productitem).permit(:product_id, :ingredient_id, :volume, :price_selector)
    end
end
