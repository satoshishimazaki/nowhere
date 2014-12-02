class Article < ActiveRecord::Base
	belongs_to :store
	# default_scope -> { order('created_at DESC') }
	validates :herenowtitle, presence: true
	validates :title, presence: true
	validates :content, presence: true
	validates :store_id, presence: true
	mount_uploader :image, ImageUploader
	geocoded_by :address
	after_validation :geocode 
	
	acts_as_mappable(:default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude)
end