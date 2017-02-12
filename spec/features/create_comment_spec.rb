require "rails_helper"

describe "Creating a comment" do

	before do
		@user = User.create!(user_attributes)
      	@category = Category.create!(name: "Rock 'n' Roll")
        @blog = Blog.create!(blog_attributes(user: @user))
        sign_in(@user)
	end

	it "saves the comment" do
		visit blog_path(@blog)

		expect(page).to have_text("0 Comments")
		fill_in "Comment", with: "Hey man great blog!"
		click_on "Comment"
		
		expect(current_path).to eq(blog_path(@blog))
		expect(page).to have_text("Your comment was successfully created")
		expect(page).to have_text("1 Comment")
		expect(page).to have_text("Hey man great blog!")
		expect(page).to have_text(@user.full_name)

	end

	it "does not save if invalid" do
		visit blog_path(@blog)

		expect(page).to have_text("0 Comments")
		fill_in "Comment", with: ""
		expect {
      		click_button 'Comment'
   	    }.not_to change(Comment, :count)

		expect(page).to have_text("Your comment couldn't be created")


	end

end