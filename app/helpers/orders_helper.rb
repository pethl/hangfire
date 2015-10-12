module OrdersHelper
  
  def get_name(saleproduct_id)
    Saleproduct.where(:id => saleproduct_id)[0].name
  end
   
  def get_count(id) #count of items in the order, i.e. quantity
    @count = 0
    orderitems = Orderitem.where(:order_id => id)
    if orderitems.any?
      orderitems.each do |orderitem| 
        if orderitem.quantity > 0
         @count += orderitem.quantity
        else
          
       end
      end  
    end
    return @count
  end
    
  
  def get_price(saleproduct_id)
    Saleproduct.where(:id => saleproduct_id)[0].price
  end
  
  def get_price_currency(saleproduct_id)
    number_to_currency(get_price(saleproduct_id))
  end

 def get_order_total(id)
    @total = 0
    orderitems = Orderitem.where(:order_id => id)
    if orderitems.any?
      orderitems.each do |orderitem| 
        if orderitem.quantity > 0
         @total += ((orderitem.quantity) * (get_price(orderitem.saleproduct_id)))
        else
          
       end
      end  
    end
    return @total
  end
  
  def get_order_total_currency(id)
    number_to_currency(get_order_total(id))
  end
  
end
