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
    	# Test writing post
        fill_in 'Sub title', with: "Change me like you changed yourself"

        click_on "Edit"
        expect(page).to have_text("Blog was successfully updated.")
        expect(current_path).to eq(blog_path(@blog.id))
    end


    it "with unvalid doesn't update the blog" do
        visit blogs_path
        click_on "Edit"

        fill_in "Title", with: ""
        click_on "Edit"

        expect(page).to have_text('error')
        expect(page).to have_text("Edit Blog")
    end
end