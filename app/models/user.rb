class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	validates(:name , presence: true , length: {maximum: 50})
	validates(:email , presence: true , length: {maximum: 244} , format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i} , uniqueness: {case_sensitive: false})
	validates(:password , length: {minimum: 6})
	validates(:password_confirmation , length: {minimum: 6})
	has_secure_password

	 def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	  end

	  # Returns a random token.
	  def User.new_token
	    SecureRandom.urlsafe_base64
	  end

	  def remember
	   self.remember_token = User.new_token
	   update_attribute(:remember_digest , User.digest(remember_token))  
	  end
end
