class ChargesController < ApplicationController
  def new
    @order = Order.find_by!(
      guid: params[:guid]
    )
  end

  def create
    
    order = Order.find_by!(
          guid: params[:guid]
        )

         token = params[:stripeToken]
        
        begin
              charge = Stripe::Charge.create(
                amount:      (get_order_total(order.id)*100).to_i,
                currency:    "gbp",
                source:      token,
                :description => 'Christmas Order',
                :metadata => {"order_ref" => order.guid}
              )
             order.update_attributes(
                :status => "Paid",
                :purchased_at => DateTime.now 
              )
              update_available_inventory(order)
              redirect_to paid_url(guid: order.guid)
            rescue Stripe::CardError => e
              # The card has been declined or
              # some other error has occurred
              @error = e
              render :new
            end    
          end
      

end
