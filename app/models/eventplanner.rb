class Eventplanner < ActiveRecord::Base
    
    has_many :eventplates
      has_many :plates, :through => :eventplates
    accepts_nested_attributes_for :eventplates, allow_destroy: true
    
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :category_id, presence: true
  
    def self.get_name(id)
      name = Eventplanner.where(:id => id)[0].name
      return name
    end
  
end
