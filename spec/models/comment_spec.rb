require 'rails_helper'

RSpec.describe Comment, type: :model do
 describe "A comment" do

  it "belongs to a blog" do
    blog = Blog.create(blog_attributes)

    comment = blog.comments.new(comment_attributes)

    expect(comment.blog).to eq(blog)
  end

  it "belongs to a user" do
    blog = Blog.create(blog_attributes)
    user = User.find(1)
    comment = blog.comments.new(comment_attributes)

    expect(comment.user).to eq(user)
  end

 it "with example attributes comment is valid" do
 	blog = Blog.create(blog_attributes)
    comment = blog.comments.new(comment_attributes)

    expect(comment.valid?).to eq(true)
 end

  it "requires content" do
    comment = Comment.new(content: "")

    comment.valid? # populates errors

    expect(comment.errors[:content].any?).to eq(true)
  end

  it "content minimum of 5 characters" do
    comment = Comment.new(content: "a" * 4 )

    comment.valid? # populates errors

    expect(comment.errors[:content].any?).to eq(true)
  end

  it "content maximum of 255 characters" do
    comment = Comment.new(content: "a" * 266 )

    comment.valid? # populates errors

    expect(comment.errors[:content].any?).to eq(true)
  end

 end

end
