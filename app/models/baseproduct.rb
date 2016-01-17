class Baseproduct < ActiveRecord::Base
  belongs_to :ingredient
  before_save :calc_prices
  validates :vendor_id, presence: true
  validates :purchase_date, presence: true
    validates :unit_count, presence: true
  validates :total_weight, presence: true
  validates :total_price, presence: true
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Baseproduct.create! row.to_hash
      	   end
  end

  
  def self.get_unique_products(vendor_id)
      @products = Baseproduct.where(:vendor_id => vendor_id).distinct(:ingredient_id)
      return @products
  end

  
  def self.get_price_per(baseproduct,shrinkage)
  
    if baseproduct.total_price.blank? || baseproduct.total_weight.blank?
      return "unavailable"
    
    elsif !shrinkage.blank?
        
                     new_weight = ((shrinkage/100).to_f) * (baseproduct.total_weight.to_f)
                     Rails.logger.debug("new_weight: #{new_weight.inspect}")

                     update_total = ((baseproduct.total_price.to_f)/ (new_weight.to_f * baseproduct.total_weight.to_f))
                     Rails.logger.debug("update_total: #{update_total.inspect}")

                     return update_total
            
      else  
          self.price_per = self.total_price.to_f/self.total_weight.to_f
    end
  end

  
  def calc_prices
  
        if self.total_weight.blank? 
              if !self.unit_weight.blank? && !self.unit_count.blank? 
                  self.total_weight = self.unit_weight * self.unit_count
              end   
      end
      
      if self.unit_weight.blank? 
              if !self.total_weight.blank? && !self.unit_count.blank? 
                  self.unit_weight = self.total_weight / self.unit_count
              end
      end
      
      if self.unit_price.blank? 
              if !self.total_price.blank? && !self.unit_count.blank? 
                 self.unit_price = self.total_price / self.unit_count
               end
      end 
      
      if !self.total_price.blank? && !self.total_weight.blank? 
       @shrinkage = Ingredient.get_shrinkage(self.ingredient_id)
     
          if @shrinkage.blank?
            self.price_per = self.total_price.to_f/self.total_weight.to_f
          else
            new_weight = (self.total_weight.to_f) * ((1-(@shrinkage/100)).to_f) 
            self.price_per = ((self.total_price.to_f)/ (new_weight.to_f))
            end      
          end
  end
end
