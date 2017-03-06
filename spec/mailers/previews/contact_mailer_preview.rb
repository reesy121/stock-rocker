# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

	def contact_preview
		ContactMailer.contact(Contact.new(name: "Dave Rees", email: "reesy121@hotmail.co.uk",
			message: "Please sir can i have some more?."))
	end
end
