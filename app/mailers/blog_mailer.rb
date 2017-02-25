class BlogMailer < ApplicationMailer

	default from: "admin@stockrocker.co.uk"

	def new_blog(user, blog)
	  @user = user
	  @blog = blog
      mail to: @user.email, subject: "New blog: #{@blog.title}"
	end
end
