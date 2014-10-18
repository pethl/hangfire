class User < ActiveRecord::Base
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  
  validates :first_name, presence: true, length: { maximum: 30 },
                     uniqueness: true
  validates :lastname, presence: true, length: { maximum: 50 },
                                           uniqueness: true                    
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def full_name
    first_name + " " + lastname
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  
  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
  

end
