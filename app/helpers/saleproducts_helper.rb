module SaleproductsHelper
  
  def percentage_sold(saleproduct)
    sold = saleproduct.stock_quantity-saleproduct.remaining_quanity
    return(((sold.to_d/saleproduct.stock_quantity.to_d).to_d)*100.to_d).to_d
    
  end
  
  def number_sold(saleproduct)
    return saleproduct.stock_quantity-saleproduct.remaining_quanity
  end
  
  def product_running_count
    paid = Order.where(:status => "Paid").pluck(:id)
    ois = Orderitem.where("order_id IN (?)", paid).pluck(:saleproduct_id, :quantity)
    ois = ois.sort_by(&:first)
    ois = ois.group_by(&:first).map{ |x, y| [y.inject(0){ |sum, i| sum + i.last }, x] }
    return ois
  end
end
