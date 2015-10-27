class FaqsController < ApplicationController
  before_action :set_saleproduct, only: [:show, :edit, :update, :destroy]
   before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]

  # GET /faqs
  def index
    @faqs = Faq.all
  end
  
  def import
       Faq.import(params[:file])
       redirect_to faqs_path, notice: "FAQs imported."
     end
  

  # GET /faqs/1
  def show
  end

  # GET /faqs/new
  def new
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit
  end

  # POST /faqs
  def create
    @faq = Faq.new(faq_params)

    if @faq.save
      redirect_to @faq, notice: 'FAQ was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /faqs/1
  def update
    if @faq.update(faq_params)
      redirect_to @faq, notice: 'FAQ was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /faqs/1
  def destroy
    @faq.destroy
    redirect_to faqs_url, notice: 'FAQ was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = Faq.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def faq_params
      params.require(:faq).permit(:title, :desc)
    end
end
