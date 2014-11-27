class Ingredient < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  
  has_many :baseproducts
  accepts_nested_attributes_for :baseproducts, allow_destroy: true
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :category_id, presence: true
    before_save :child_calc_prices
      
  def self.get_name(id)
    name = Ingredient.where(:id => id)[0].name
    return name
  end
  
  def self.get_unit_item(id)
    unit_item = Ingredient.where(:id => id)[0].unit_item
    return unit_item
  end
  
  def child_calc_prices
    self.baseproducts.each do |baseproduct|
      if !baseproduct.total_price.blank? && !baseproduct.total_weight.blank? 
       @shrinkage = (1-(self.shrinkage/100))
        
          if @shrinkage.blank?
            baseproduct.price_per = baseproduct.total_price.to_f/baseproduct.total_weight.to_f
          else
            new_weight = (baseproduct.total_weight.to_f) * (@shrinkage.to_f) 
            baseproduct.price_per = ((baseproduct.total_price.to_f)/ (new_weight.to_f))
          end      
          end
        end
  end
  
  def self.get_shrinkage(id)
    shrinkage = Ingredient.where(:id => id)[0].shrinkage
    return shrinkage
  end  
  
  def self.get_category(id)
    category = (Ingredient.where(:id => id))[0].category_id 
    return category
  end  
  
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Ingredient.create! row.to_hash
      	end
    	end
   	
    	
  	def self.get_unit_weight(id)
  	  a = Baseproduct.where(:ingredient_id => id).sort_by { |h| h[:purchase_date]}.reverse
  	  a.first.unit_weight
	  end
  	
       def self.get_price(id,selector)
         case selector
             when "average"
               self.average_price(id)
             when "latest"
                self.latest_price(id)
             when "least"
                self.least_price(id)
             when "most"
                self.most_price(id)
             else
               puts "No price selector given"
             end
          end

          def self.record_age(id)
            a = Baseproduct.where(:ingredient_id => id).sort_by { |h| h[:purchase_date]}.reverse
            if a.any?
              if (Date.today - a.first.purchase_date).to_i < 32
                "green"
              elsif (Date.today - a.first.purchase_date).to_i < 63
                "amber"
              else
                "red"
              end
             else
                "-"
              end
          end
          
        def self.average_price(id)
            a = Baseproduct.where(:ingredient_id => id)
            if a.any?
            a.average('price_per') 
          else
            "no data"
          end
        end

        def self.latest_price(id)
          a = Baseproduct.where(:ingredient_id => id).sort_by { |h| h[:purchase_date]}.reverse
          if a.any?
          a.first.price_per
           else
              "no data"
            end
        end  
        
       def self.least_price(id)
          a = Baseproduct.where(:ingredient_id => id).sort_by { |h| h[:price_per]}
          if a.any?
          a.first.price_per
           else
              "no data"
            end
        end
          
       def self.most_price(id)
          a = Baseproduct.where(:ingredient_id => id).sort_by { |h| h[:price_per]}.reverse
          if a.any?
          a.first.price_per
           else
              "no data"
            end
        end
end
