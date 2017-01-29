require 'rails_helper'

describe "Viewing an individual category" do

	it "shows the category and it's associaed blogs details " do
		user = User.create!(user_attributes)
		category = Category.create!(category_attributes)
		blog = Blog.create!(blog_attributes(user_id: user.id, 
				categorizations_attributes: {"0"=>{"category_id"=> category.id, "_destroy"=>"false"} }))

		visit category_path(category)

		expect(page).to have_title("#{category.name} | Stock Rocker Blog")
		expect(page).to have_text(category.name)
		expect(page).to have_text(blog.title)
		expect(page).to have_text(blog.sub_title)
		expect(page).to have_text(blog.user.full_name)
		expect(page).to have_link("Read")
		expect(page).not_to have_link("Edit")
		expect(page).not_to have_link("Delete")

	end

end