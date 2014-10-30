class PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]
      before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]

  # GET /plates
  def index
    @plates_by_category = Plate.all.group_by { |t| t.category_id }
  end

  # GET /plates/1
  def show
     @productlinks = Productlink.where(:plate_id => @plate.id)
  end

  # GET /plates/new
  def new
    @plate = Plate.new
  end

  # GET /plates/1/edit
  def edit
  end

  # POST /plates
  def create
    @plate = Plate.new(plate_params)

    if @plate.save
      redirect_to @plate, notice: 'Plate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /plates/1
  def update
    if @plate.update(plate_params)
      redirect_to @plate, notice: 'Plate was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /plates/1
  def destroy
    @plate.destroy
    redirect_to plates_url, notice: 'Plate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @plate = Plate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plate_params
      params.require(:plate).permit(:price, :name, :category_id, productlinks_attributes:[:_destroy, :id, :plate_id, :product_id])
    end
end
