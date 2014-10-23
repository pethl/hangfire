module IngredientsHelper
  
  def add_baseproduct_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :baseproduct, :partial => 'baseproduct', :object => Baseproduct.new
    end
  end
end
