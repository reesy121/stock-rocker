# Preview all emails at http://localhost:3000/rails/mailers/blog_mailer
class BlogMailerPreview < ActionMailer::Preview

	def new_blog_preview
		BlogMailer.new_blog(User.first, Blog.first)
	end
end