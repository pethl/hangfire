class StripeMailer < ActionMailer::Base
  default from: 'hangfirebbq@gmail.com'

  def admin_dispute_created(charge)
    @charge = charge
    @order = Order.find_by(strip_id: @charge.id)
    if @order
      mail(to: 'contacthangfirebbq@gmail.com', subject: "Dispute created on charge #{@order.guid} (#{charge.id})").deliver
    end
  end
  
  def admin_charge_succeeded(charge)
    @charge = charge
    @order = Order.find_by!(strip_id: @charge.id)
    mail(to: 'hangfirebbq@gmail.com', subject: "Christmas Orders - New Order:#{@order.guid}")
    end

  def receipt(charge)
    @charge = charge
    @order = Order.find_by!(strip_id: @charge.id)
    mail(to: @order.email, subject: "Order Confirmation from Hang Fire Smokehouse")
    end
end