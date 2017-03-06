class ContactMailer < ApplicationMailer

	default to: "life.admin@stockrocker.co.uk"
	#default from: @contact.email

	def contact(contact)
		@contact = contact
    	mail from: "life.admin@stockrocker.co.uk", subject: "Contact Us Message from #{@contact.name}"
	end
end
