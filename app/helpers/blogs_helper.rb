module BlogsHelper

	def preview_button?
		params[:preview_button].present?
	end

	def clear_preview_button
		params.delete :preview_button
	end

	def pluralize_to_s(count, word)
		cnt = count
		pluralized = word.pluralize(cnt)
		"#{cnt} #{pluralized}"
	end

	def users_blog?(blog)
		current_user.id == blog.user_id rescue false
	end
	
end
