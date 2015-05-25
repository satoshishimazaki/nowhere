class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :views
  has_many :comments
  # has_many :comments_articles, through: :comments, source: :article
  has_and_belongs_to_many :article_images

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def favorite?(article)
    favorites.find_by(article_id: article.id)
  end

  def favorite!(article)
    favorites.create!(article_id: article.id)
  end

  def unfavorite!(article)
    favorites.find_by(article_id: article.id).destroy
  end
   
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
