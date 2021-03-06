class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]

  # GET /categories
  def index
    @categories_by_reference = Category.all.group_by { |t| t.reference }
  end

  # GET /categories/1
  def show
    @products = Product.where(:category_id => @category.id)
    @ingredients = Ingredient.where(:category_id => @category.id)
    @plates = Plate.where(:category_id => @category.id)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :reference)
    end
end
