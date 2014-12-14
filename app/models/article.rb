class Article < ActiveRecord::Base
	belongs_to :store
	# default_scope -> { order('created_at DESC') }
	validates :herenowtitle, presence: true
	validates :title, presence: true
	validates :content, presence: true
	validates :store_id, presence: true
	validates :dead_line, presence: true
	mount_uploader :image, ImageUploader
	geocoded_by :address
	after_validation :geocode 
	acts_as_mappable(:default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude)
    has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
    has_many :article_images
    has_many :views
    accepts_nested_attributes_for :article_images
	def Article.method_name
		self.where('')
	end
end