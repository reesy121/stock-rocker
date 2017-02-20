require "rails_helper"

describe "Contact mailer sending an email" do
  
	before do
		@contact = Contact.new(contact_attributes)
		@mail = ContactMailer.contact(@contact).deliver_now
	end

	it 'renders the subject' do
      expect(@mail.subject).to eq("Contact Us Message from #{@contact.name}")
    end

   it 'renders the receiver email' do
      expect(@mail.to).to eq(["admin@stockrocker.co.uk"]) #change me?
   end

   it 'renders the sender email' do
     expect(@mail.from).to eq([@contact.email])
   end

   #it "renders the body"

end
