require 'rails_helper'

describe "Viewing categories" do

	it "shows categories and associated blogs" do
		user = User.create!(user_attributes)
		category = Category.create!(category_attributes)
		blog = Blog.create!(blog_attributes(user_id: user.id, 
				categorizations_attributes: {"0"=>{"category_id"=> category.id, "_destroy"=>"false"} }))

		visit categories_path

		expect(page).to have_text(category.name)
		expect(page).to have_text("1 Blog")
		expect(page).to have_title("Categories | Stock Rocker Blog")
	end

	it "does not show category without associated blog" do
		category = Category.create!(category_attributes)

		visit categories_path

		expect(page).not_to have_text(category.name)
	end

end