class Article < ActiveRecord::Base
	belongs_to :store
	default_scope -> { order('created_at DESC') }
	validates :herenowtitle, presence: true
	validates :title, presence: true
	validates :content, presence: true
	validates :store_id, presence: true
	mount_uploader :image, ImageUploader
end