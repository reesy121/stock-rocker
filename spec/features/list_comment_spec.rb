require "rails_helper"

describe "Viewing comments" do

	  it "shows the comments for the specific blog" do
	  	user = User.create!(user_attributes)
      	category = Category.create!(name: "Rock 'n' Roll")
        blog = Blog.create!(blog_attributes(user: user))
        blog1 = Blog.create!(blog_attributes(user: user, title: "Second title!"))
        comment = Comment.create!(comment_attributes(content: "My first baby", blog: blog, user: user))
        comment1 = Comment.create!(comment_attributes(content: "My second baby", blog: blog1, user: user))

        visit(blog_path(blog))
        expect(page).to have_text(comment.content)
        expect(page).to have_text(comment.user.full_name)
        expect(page).not_to have_text(comment1.content)

	  end

end