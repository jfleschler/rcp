require 'digest'

class User < ActiveRecord::Base
	attr_accessible :username, :email, :password, :password_confirmation
	has_secure_password
	validates :password, :presence => true, :on => :create
	validates :username, :uniqueness => true, :presence => true
	validates :email,    :uniqueness => true, :presence => true

	has_many :recipes, :dependent => :destroy

	before_save :generate_salt

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end

	private

		def generate_salt
			self.salt = make_salt if new_record?
		end

		def make_salt
	      secure_hash("#{Time.now.utc}--#{password}")
	    end

	    def secure_hash(string)
	      Digest::SHA2.hexdigest(string)
	    end
end
