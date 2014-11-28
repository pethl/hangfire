class ProductlinksController < ApplicationController
  
  def create
    
    product = Product.where(:id => params[:productlink_id])
    
    @productlink = Productlink.new(:plate_id => params[:plate_id], :product_id => 1)
    if @productlink.save
      flash[:notice] = "Added product."
      redirect_to :back
    else
      flash[:notice] = "Unable to add product."
      redirect_to :back
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productlink
      @productlink = Productlink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def productlink_params
      params.require(:productlink).permit(:product_id, :productlink_id)
    end
  
  
end
