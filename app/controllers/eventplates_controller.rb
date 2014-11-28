class EventplatesController < ApplicationController
  before_action :set_eventplate, only: [:show, :edit, :update, :destroy]


  # POST /eventproducts
  def create
    
    eventplate = Eventplate.where(:id => params[:eventplate_id])
    
    @eventplate = Eventplate.new(:eventplanner_id => params[:eventplanner_id], :plate_id => 1)
    if @eventplate.save
      flash[:notice] = "Added plate."
      redirect_to :back
    else
      flash[:notice] = "Unable to add plate."
      redirect_to :back
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventplate
      @eventplate = Eventplate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def eventplate_params
      params.require(:eventplate).permit(:eventplanner_id, :plate_id, :covers, :over_ride_price)
    end
end
