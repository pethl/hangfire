class StripeMailer < ActionMailer::Base
  default from: 'contacthangfirebbq@gmail.com'

  def admin_dispute_created(charge)
    @charge = charge
    @order = Order.find_by(stripe_id: @charge.id)
    if @order
      mail(to: 'contacthangfirebbq@gmail.com', subject: "Dispute created on charge #{@order.guid} (#{charge.id})").deliver
    end
  end
  
  def admin_charge_succeeded(charge)
      @charge = charge
      mail(to: 'contacthangfirebbq@gmail.com', subject: 'Woo! Charge Succeeded!')
    end

    def receipt(charge)
      @charge = charge
      @order = Order.find_by!(stripe_id: @charge.id)
      mail(to: @order.email, subject: "Thanks for purchasing #{@sale.product.name}")
    end
end