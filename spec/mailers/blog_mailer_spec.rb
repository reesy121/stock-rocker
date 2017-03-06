require "rails_helper"

describe "Blog mailer sending an email" do
  
	before do
	  @user = User.create!(user_attributes)
	  @blog = Blog.create!(blog_attributes(user_id: @user.id))
	  @mail = BlogMailer.new_blog(@user, @blog).deliver_now
	end

	it 'renders the subject' do
	  expect(@mail.subject).to eq("New blog: #{@blog.title}")
	end

	it 'renders the receiver email' do
      expect(@mail.to).to eq([@user.email])
    end

    it 'renders the sender email' do
     expect(@mail.from).to eq(["life.admin@stockrocker.co.uk"])
    end

end