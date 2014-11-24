class Product < ActiveRecord::Base
  has_many :productitems
  has_many :friendships
  has_many :friends, :through => :friendships
   belongs_to :category
  
  accepts_nested_attributes_for :productitems, allow_destroy: true
    accepts_nested_attributes_for :friendships, allow_destroy: true
   validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :category_id, presence: true

    
    def self.get_name(id)
      name = Product.where(:id => id)[0].name
      return name
    end  
    
 def self.get_total_price(id)
      @productitems = Productitem.where(:product_id => id)
     # @total = 0
      @total = @productitems.to_a.sum do |line_item|
        price = Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
        if price == "no data"
          "missing data"
          return 0
        else
             if !line_item.volume.blank?
              line_item.volume*price
             else
               uc = line_item.unit_count * (Ingredient.get_unit_weight(line_item.ingredient_id))
               uc*price
             end
        end
     end
    end
    
    def self.get_plate_total_ratios_price(id)
      @products = Productlink.where(:plate_id => id)
       @all_products_total=[]
        @products.each do |product|
          @all_products_total << Product.get_total_price(product.product_id)
        end
        return @all_products_total.inject 0, :+
    end
    
    def self.get_total_ratios_price(id)
      @products = Friendship.where(:product_id => id)
      @all_products_total=[]
      @products.each do |product|
        @all_products_total << Product.get_ratios_price(product.friend_id,product.prodvolume)
      end
      return @all_products_total.inject 0, :+
    end
      
    def self.get_ratios_price(friend_id,prodvolume)
     # @products = Friendship.where(:product_id => id).map {|x| [x.friend_id, x.prodvolume]}
     # friend = Friendship.where(:friend_id => id).first

        @productitems = Productitem.where(:product_id => friend_id)
          @final_total =[]
          product_total = @productitems.each do |line_item|
            prodratio = Productitem.weight_ratio(line_item,0)
            new_weight = ((prodvolume)*(Productitem.weight_ratio(line_item,0)).to_f)
            price_per = Ingredient.get_price(line_item.ingredient_id, line_item.price_selector)
            @final_total << (new_weight.to_f)*(price_per)
        end
        return @final_total.inject 0, :+
    end    

    def self.get_total_weight(id)     # this gets the weight of all ingredients except where category 7,8,9 - non food items 
      @categories_to_ignore = [7,8,9]
      
      @duffproductitems = Productitem.where(:product_id => id)
      
      @duffproductitems.each do |duffproductitem|
        if @categories_to_ignore.include? (Ingredient.where(:id => duffproductitem.ingredient_id)).first.category_id 
         
          @duffproductitems = @duffproductitems.select{|x| x != duffproductitem}
        else
      end
    end
           @weight = 0
           @weight = @duffproductitems.to_a.sum do |productitem|
              if !productitem.volume.blank?
                productitem.volume
              else
                productitem.unit_count * (Ingredient.get_unit_weight(productitem.ingredient_id))
              end
            end
            @friends = Friendship.where(:product_id => id)
           @weight += @friends.to_a.sum do |friend|
             friend.prodvolume
           end
    end   
    
    def self.get_total_ingredient_weight(id)
         @categories_to_ignore = [7,8,9]

          @duffproductitems = Productitem.where(:product_id => id)

          @duffproductitems.each do |duffproductitem|
            if @categories_to_ignore.include? (Ingredient.where(:id => duffproductitem.ingredient_id)).first.category_id 

              @duffproductitems = @duffproductitems.select{|x| x != duffproductitem}
            else
          end
        end
      
      @weight = 0
      @weight = @duffproductitems.to_a.sum do |productitem|
         if !productitem.volume.blank?
           productitem.volume
         else
           productitem.unit_count * (Ingredient.get_unit_weight(productitem.ingredient_id))
         end
       end
     
    end 
  
end
