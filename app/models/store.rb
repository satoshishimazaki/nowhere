class Store < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
	validates :name, presence: { message: "入力してください" }, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: { message: "入力してください" }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	# validates :tel, presence: true
	# validates :url, presence: true
	has_secure_password
	validates :password, length: { minimum: 6 }
  geocoded_by :address  
  after_validation :geocode 

  acts_as_mappable(:default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude)

  # validate :add_error_sample

  #   def add_error_sample
  #     if name.empty?
  #       errors.add(:name, "に関するエラーを追加")
  #       errors[:base]<< "モデル全体に関係するエラーを追加"
  #     end
  #   end

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
