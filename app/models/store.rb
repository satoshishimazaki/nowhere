class Store < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :tel, presence: true
	validates :url, presence: true
	has_secure_password
	validates :password, length: { minimum: 6 }

  geocoded_by :address  
  after_validation :geocode 

    def Store.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def Store.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    private

    def create_remember_token
      self.remember_token = Store.encrypt(Store.new_remember_token)
    end
end
