require 'rails_helper'

describe "Deleting a blog" do

	before do
      @admin_user = User.create!(user_attributes(admin: true))
      @category = Category.create!(name: "Rock 'n' Roll")
      sign_in(@admin_user)
    end

	it "destroys the blogs and shows the blog listing without the blog" do
		blog = Blog.create!(blog_attributes(user_id: @admin_user.id))
		visit blogs_path

		click_on 'Delete'
		expect(current_path).to eq(blogs_path)
		expect(page).not_to have_text(blog.title)
		expect(page).to have_text("Blog was successfully deleted")
	end

end