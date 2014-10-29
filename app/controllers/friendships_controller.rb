class FriendshipsController < ApplicationController
    before_action :signed_in_user, only: [:edit, :update, :destroy, :index, :show, :new]
  
  def create

   @friendship = Friendship.new(:product_id => params[:product_id])
   if @friendship.save
     flash[:notice] = "Enter product."
     redirect_to :back
   else
     flash[:notice] = "Unable to add product."
     redirect_to :back
   end
 end
 
 def destroy
   @friendship = Friendship.find(params[:id])
   @friendship.destroy
   flash[:notice] = "Removed product."
   redirect_to :back
 end
 
end
