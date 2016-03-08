class User < ActiveRecord::Base
	before_save { email.downcase! }
	before_save { username.downcase! }

	validates :full_name, length: { maximum: 25 }, presence: true
	validates :username, length: { maximum: 12 }, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, length: { maximum: 244 }, presence: true,
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 8}, presence: true

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end