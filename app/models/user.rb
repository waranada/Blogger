class User < ActiveRecord::Base
	validates :full_name, length: { maximum: 25 }, presence: true
	validates :username, length: { maximum: 12 }, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: { maximum: 244 }, presence: true,
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
end