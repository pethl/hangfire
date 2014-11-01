class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]

  
  # GET /ingredients
  def index
      @ingredients = Ingredient.all
     @ingredients_category = @ingredients.group_by { |t| t.category_id }
  end

  # GET /ingredients/1
  def show
    @baseproducts = Baseproduct.where(:ingredient_id => @ingredient.id)
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient, notice: 'Ingredient was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end
  
  def import
       Ingredient.import(params[:file])
       redirect_to ingredients_path, notice: "Ingredients imported."
     end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :category_id, baseproducts_attributes:[:_destroy, :id, :ingredient_id, :purchase_date, :unit_weight, :total_weight, :unit_count, :total_price, :unit_price, :price_per, :ingredient_id, :vendor_id])
    end
end
