class ContactMailer < ApplicationMailer

	default to: "admin@stockrocker.co.uk"
	#default to: "reesy121@hotmail.co.uk"

	def contact(contact)
		@contact = contact
    	mail from: @contact.email, subject: "Contact Us Message from #{@contact.name}"
	end
end
