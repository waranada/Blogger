class User < ActiveRecord::Base
	validates :full_name, length: { maximum: 25 }, presence: true
	validates :username, length: { maximum: 12 }, presence: true
	validates :email, length: { maximum: 244 }, presence: true
end


