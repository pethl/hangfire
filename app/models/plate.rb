class Plate < ActiveRecord::Base
  has_many :productlinks
  
  accepts_nested_attributes_for :productlinks, allow_destroy: true
      validates :category_id, presence: true
            validates :price, presence: true
            
      def self.get_name(id)
        name = Plate.where(:id => id)[0].name
        return name
      end        
            
            
end
