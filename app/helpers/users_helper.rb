module UsersHelper

	def logged_in?
		!current_user.nil?
	end

	def admin_user?
		current_user.try(:admin?)
	end

end
