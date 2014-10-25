class ProductlinksController < ApplicationController
  def create
    
    product = Product.where(:id => params[:productlink_id])
    
    @productlink = Productlink.new(:friend_id => params[:friend_id], :product_id => 1)
    if @productlink.save
      flash[:notice] = "Added product."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add product."
      redirect_to root_url
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
