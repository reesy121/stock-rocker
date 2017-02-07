require 'rails_helper'

describe 'Viewing the list of blogs' do

	it "shows the blogs and some details" do
		user = User.create!(user_attributes)
		category = Category.create!(category_attributes)
		blog = Blog.create!(blog_attributes(user_id: user.id, 
				categorizations_attributes: {"0"=>{"category_id"=> category.id, "_destroy"=>"false"} }))
		blog1 = Blog.create!(blog_attributes(user_id: user.id, title: "Second Title Baby!!!", 
				categorizations_attributes: {"0"=>{"category_id"=> category.id, "_destroy"=>"false"} }))

		visit blogs_path

		expect(page).to have_text(blog.title)
		expect(page).to have_text(blog1.title)
		expect(page).to have_text(blog.sub_title)
		expect(page).to have_text(user.full_name)
		expect(page).to have_text("Read")
		expect(page).to have_text(blog.created_at.to_date)
		# Not signed in as admin so edit delete etc shouldn't appear
		expect(page).not_to have_text("Edit")
		expect(page).not_to have_text("Delete")
		expect(page).not_to have_text("New Blog")

	end  



end