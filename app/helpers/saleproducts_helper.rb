module SaleproductsHelper
  
  def percentage_sold(saleproduct)
    sold = saleproduct.stock_quantity-saleproduct.remaining_quanity
    return(((sold.to_d/saleproduct.stock_quantity.to_d).to_d)*100.to_d).to_d
    
  end
  
  def number_sold(saleproduct)
    return saleproduct.stock_quantity-saleproduct.remaining_quanity
  end
end
