module BlogsHelper

	def preview_button?
		params[:preview_button].present?
	end

	def clear_preview_button
		params.delete :preview_button
	end
end
