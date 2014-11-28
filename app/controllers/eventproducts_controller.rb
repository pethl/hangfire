class EventproductsController < ApplicationController
  before_action :set_eventproduct, only: [:show, :edit, :update, :destroy]



  # POST /eventproducts
  def create
    
    eventproduct = Eventproduct.where(:id => params[:eventproduct_id])
    
    @eventproduct = Eventproduct.new(:eventplanner_id => params[:eventplanner_id], :product_id => 1)
    if @eventproduct.save
      flash[:notice] = "Added product."
      redirect_to :back
    else
      flash[:notice] = "Unable to add product."
      redirect_to :back
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventproduct
      @eventproduct = Eventproduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def eventproduct_params
      params.require(:eventproduct).permit(:eventplanner_id, :product_id, :covers, :over_ride_price)
    end
end
