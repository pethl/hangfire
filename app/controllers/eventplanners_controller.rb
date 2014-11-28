class EventplannersController < ApplicationController
  before_action :set_eventplanner, only: [:show, :edit, :update, :destroy]

  # GET /eventplanners
  def index
    @eventplanners = Eventplanner.all
  end

  # GET /eventplanners/1
  def show
     @eventplates = Eventplate.where(:eventplanner_id => @eventplanner.id)
  end

  # GET /eventplanners/new
  def new
    @eventplanner = Eventplanner.new
  end

  # GET /eventplanners/1/edit
  def edit
  end

  # POST /eventplanners
  def create
    @eventplanner = Eventplanner.new(eventplanner_params)

    if @eventplanner.save
      redirect_to eventplanners_path, notice: 'Eventplanner was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /eventplanners/1
  def update
    if @eventplanner.update(eventplanner_params)
      redirect_to @eventplanner, notice: 'Eventplanner was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /eventplanners/1
  def destroy
    @eventplanner.destroy
    redirect_to eventplanners_url, notice: 'Eventplanner was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventplanner
      @eventplanner = Eventplanner.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def eventplanner_params
      params.require(:eventplanner).permit(:name, :category_id, eventplates_attributes:[:_destroy, :id, :eventplanner_id, :plate_id, :covers, :over_ride_price])    
    end
end
