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

    def left_time
      self.created_at + 24.hours - Time.now
    end

    def left_hour
      self.left_time.div(3600)	
    end

    def left_minute
      (self.left_time/3600 - self.left_hour)*60.floor
    end

    def left_second
      (self.left_time/60 - left_time.div(60))*60.floor
    end

	def Article.method_name
		self.where('')
	end
end