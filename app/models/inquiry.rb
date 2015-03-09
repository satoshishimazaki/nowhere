class Inquiry < ActiveRecord::Base
	# attr_accessor :name, :email, :content

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
