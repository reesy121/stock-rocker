require 'rails_helper'

describe "Deleting a comment" do

	before do
		@user = User.create!(user_attributes)
      	@category = Category.create!(name: "Rock 'n' Roll")
        @blog = Blog.create!(blog_attributes(user: @user))
        @comment = Comment.create!(comment_attributes(content: "My first baby", blog: @blog, user: @user))
        @comment1 = Comment.create!(comment_attributes(content: "My second baby", blog: @blog, user: @user))
        sign_in(@user)
	end

	it "destroys the comment and displays the blog without the comment" do
		visit blog_path(@blog)

		expect(page).to have_text("2 Comments")
		expect(page).to have_text(@comment.content)
		expect(page).to have_text(@comment1.content)

		find("a[href='/comments/#{@comment.id}']").click
		expect(current_path).to eq(blog_path(@blog))
		expect(page).to have_text("Your comment was successfully deleted!")
		expect(page).not_to have_text(@comment.content)
	end

end