class Faq < ActiveRecord::Base
  
  validates :title, presence: true 
  validates :desc, presence: true 
 default_scope { order('sort ASC') }
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Faq.create! row.to_hash
      	end
      end
end
