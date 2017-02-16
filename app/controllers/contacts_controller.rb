class ContactsController < ApplicationController
 
  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.valid?
      ContactMailer.contact(@contact).deliver_now
      redirect_to root_path, notice: "Thanks, your message has been sent"
    else
      flash.now[:alert] = "Sorry we couldn't send your message"
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
