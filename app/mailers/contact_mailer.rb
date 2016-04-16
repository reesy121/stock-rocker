class ContactMailer < ApplicationMailer

	default to: "reesy121@hotmail.co.uk"
	default from: "Your Mailer <noreply@yourdomain.com>"

	def contact(contact)
		@contact = contact
    	mail from: @contact.email, subject: "Contact Us Message from #{@contact.name}"
	end
end
