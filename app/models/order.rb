class Order < ActiveRecord::Base
  has_many :orderitems, -> { order(saleproduct_id: :asc) }, :dependent => :destroy
   accepts_nested_attributes_for :orderitems, :reject_if => lambda { |a| a[:quantity].blank? }
   before_save :populate_guid
       validates_uniqueness_of :guid

   def to_param
     guid
   end
   
  validates :status, :on => :update, presence: true 
  validates :date_selector, :on => :update, presence: true
  validates :contact_person, :on => :update, presence: true
  validates :phone, :on => :update, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, :on => :update, :on => :update, format:  { with: VALID_EMAIL_REGEX }, :exclusion =>  { :in => %w(your@email.com), :message => " : Please enter a contact email." }

  COLLECTION_DATE_TYPES = ["Monday, 21st December", "Tuesday, 22nd December", "Wednesday, 23rd December"]
  ORDER_STATUS_TYPES = [["Open", "Open"], ["Paid", "Paid"], ["Collected", "Collected"]]

  private

   def populate_guid
     if new_record?
       while !valid? || self.guid.nil?
         self.guid = SecureRandom.random_number(1_000_000_000).to_s(36)
       end
     end
   end

end
