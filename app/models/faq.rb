class Faq < ActiveRecord::Base
  
  validates :title, presence: true 
  validates :desc, presence: true 
  
  def self.import(file)
      	 CSV.foreach(file.path, headers: true) do |row|
         		 Faq.create! row.to_hash
      	end
      end
end
