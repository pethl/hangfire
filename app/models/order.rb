class Order < ActiveRecord::Base
  has_many :orderitems, -> { order(saleproduct_id: :asc) }, :dependent => :destroy
   accepts_nested_attributes_for :orderitems, :reject_if => lambda { |a| a[:quantity].blank? }
  
  validates :contact_person, presence: true, length: { maximum: 40 }
  validates :date_selector, presence: true 
  validates :status, presence: true 
  validates :phone, presence: true 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }
  
  
  COLLECTION_DATE_TYPES = ["21st December", "22nd December", "23rd December"]
  ORDER_STATUS_TYPES = ["Open", "Paid", "Collected"]

end
