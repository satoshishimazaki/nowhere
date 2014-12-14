class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :views

  def favorite?(article)
    favorites.find_by(article_id: article.id)
  end

  def favorite!(article)
    favorites.create!(article_id: article.id)
  end

  def unfavorite!(article)
    favorites.find_by(article_id: article.id).destroy
  end
end
