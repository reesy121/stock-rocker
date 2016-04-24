module BlogsHelper

	def preview_button?
		params[:preview_button].present?
	end

end
