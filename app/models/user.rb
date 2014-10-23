class User < ActiveRecord::Base
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  has_secure_password
  
  
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :lastname, presence: true, length: { maximum: 40 }  
                   
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
      
      def encrypt_password
         self.salt = make_salt unless has_password?(password)
         self.encrypted_password = encrypt(password)
       end

       def encrypt_string
         secure_hash("#{salt}--#{string}")
       end

       def make_salt
         secure_hash("#{Time.now.utc}--#{password}")
       end

       def secure_hash(string)
         Digest::SHA2.hexdigest(string)
       end
  

end