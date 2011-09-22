module SessionsHelper

	def sign_in!(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		self.current_user = user
	end
	
	def sign_out
    	cookies.delete(:remember_token)
    	self.current_user = nil
  	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= user_from_remember_token
	end

	def signed_in?
    	!current_user.nil?
  	end

	def authenticate
	    deny_access unless signed_in?
	end

	def deny_access
		store_location
		redirect_to signin_path, :notice => "please sign in."
	end

	private
		
		def user_from_remember_token
			User.authenticate_with_salt(*remember_token)
		end

		def remember_token
			cookies.signed[:remember_token] || [nil, nil]
		end
end
