class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_user, only: [ :show] 
   before_filter :correct_user,   only: [:edit, :update, :show]

  

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :lastname, :email, :phone, :admin, :bill_addr1, :bill_addr2, :bill_addr3, :bill_addr4, :bill_postcode, :delivery_addr1, :delivery_addr2, :delivery_addr3, :delivery_addr4, :delivery_postcode, :password, :password_confirmation)
    end
    
    def signed_in_user
           redirect_to signin_url, notice: "Please sign in." unless signed_in?
     end

    def correct_user  #note here correct user also allows admin access
            @user = User.find(params[:id])
            redirect_to(root_path) unless current_user?(@user) or current_user.admin?
     end
     
     def admin_user
                redirect_to(root_path) unless current_user.admin?
          end
     

 end
