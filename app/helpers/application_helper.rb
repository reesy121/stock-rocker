module ApplicationHelper

	def full_title(title="")
		base_title = "Stock Rocker R'n'R Blog"
		!title.empty? ? "#{title} | #{base_title}" : "#{base_title}"
	end

end
