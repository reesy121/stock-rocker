require "rails_helper"

describe "Blog mailer sending an email" do
  
	before do
		@contact = Contact.new(contact_attributes)
		@mail = ContactMailer.contact(@contact).deliver_now
	end

end