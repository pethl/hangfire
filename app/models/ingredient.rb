class Ingredient < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  
  has_many :baseproducts
  accepts_nested_attributes_for :baseproducts, allow_destroy: true
  
    validates :name, presence: true, uniqueness: true
      validates :category_id, presence: true

  def self.get_name(id)
    name = Ingredient.where(:id => id)[0].name
    return name
  end
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Ingredient.create! row.to_hash
      	end
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
