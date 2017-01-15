module ApplicationHelper

	def full_title(title="")
		base_title = "Stock Rocker Blog"
		!title.empty? ? "#{title} | #{base_title}" : "#{base_title}"
	end

end
