class SessionsController < ApplicationController
  
  def new
     end

 def create
   user = User.find_by(email: params[:session][:email].downcase)
   Rails.logger.debug("My create: #{user.inspect}")
       if user && user.authenticate(params[:session][:password])
         sign_in user
               redirect_to user
       else
         Rails.logger.debug("Gone into else")
         flash.now[:danger] = 'Invalid email/password combination'
              render 'new'
       end
 end

 def destroy
      sign_out
      redirect_to root_url
 end

  
end
