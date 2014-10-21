class Baseproduct < ActiveRecord::Base
  belongs_to :ingredient
  before_save :calc_prices
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Baseproduct.create! row.to_hash
      	end
    	end
  
  def price_per
    if self.total_price.blank? || self.total_weight.blank?
      return "unavailable"
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
        if self.unit_price.blank? 
               if !self.total_price.blank? && !self.unit_count.blank? 
                 Rails.logger.debug("in test: #{self.total_price.inspect}")
                 self.unit_price = self.total_price / self.unit_count
         end
    end
        if self.total_price.blank? || self.total_weight.blank?
          return "unavailable"
        else

        self.price_per = self.total_price.to_f/self.total_weight.to_f
      end
  end
end
