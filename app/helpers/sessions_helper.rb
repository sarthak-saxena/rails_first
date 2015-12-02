module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
	@current_user = @current_user || User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
	#stores url tryin to be accessed
	def store_location
		session[:store_loc] = request.url
	end
	def redirect_back_url(default)
		redirect_to(session[:store_loc] || default)
		session.delete(:store_loc)
	end
end
