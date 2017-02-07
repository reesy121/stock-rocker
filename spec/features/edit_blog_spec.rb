require 'rails_helper'

describe "Editing a blog" do

	before do
		@admin_user = User.create!(user_attributes(admin: true))
      	@category = Category.create!(name: "Rock 'n' Roll")
        @blog = Blog.create!(blog_attributes(user_id: @admin_user.id))
        sign_in(@admin_user)
    end

    it "with valid details updates the blog" do
    	visit blogs_path
    	click_on "Edit"

    	expect(page).to have_text("Edit Blog")
    	fill_in "Title", with: "I've just changed you"
    	#
    end


    it "with unvalid doesn't update the blog"
end