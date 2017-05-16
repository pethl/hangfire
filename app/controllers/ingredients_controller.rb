class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]

  def index
  @ingredients = []
      #take params from search on Index view, or if no search, assume blank
      #send to model to apply SEARCH function, which retrieves matching records 
       if params[:ingredient]
        @ingredients = Ingredient.search(params[:ingredient])
               if @ingredients.any?
                # Rails.logger.debug("xxxxxxxxxxxxx_inregdients : #{@ingredients.count}")  
              
                 @ingredients_category = @ingredients.group_by { |t| t.category_id }
      
               else
                 params[:ingredient]= []
                 @ingredients = 0
               end
       else
         @ingredients = 0
        params[:ingredient]= []
       end
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
      params.require(:ingredient).permit(:name, :category_id, :unit_item, :shrinkage, baseproducts_attributes:[:_destroy, :id, :ingredient_id, :purchase_date, :unit_weight, :total_weight, :unit_count, :total_price, :unit_price, :price_per, :ingredient_id, :vendor_id])
    end
end
