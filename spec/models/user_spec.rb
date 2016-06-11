require 'rails_helper'

RSpec.describe User, type: :model do
  it "first name must be present" do
  	@user = User.new(user_attributes( { first_name: "" } ) )

  	@user.valid? #populates errors

  	expect(@user.errors[:first_name].any?).to eq(true)
  end

  it "last name must be present" do
  	@user = User.new(user_attributes( { last_name: "" } ) )

  	@user.valid? #populates errors

  	expect(@user.errors[:last_name].any?).to eq(true)
  end

  it "email must be present" do
  	@user = User.new(user_attributes( { email: "" } ) )

  	@user.valid? #populates errors

  	expect(@user.errors[:email].any?).to eq(true)
  end

  it "email must be unique" do
    @user = User.create(user_attributes)
    @user = User.new(user_attributes)

    @user.valid?

    expect(@user.errors[:email].any?).to eq(true)
  end

  it "passwords must match" do
    @user = User.new(user_attributes({ password_confirmation: "notthesamepassword"}) )

    @user.valid?

    expect(@user.errors[:password_confirmation].any?).to eq(true)
  end

  it "full name method collates first and last name" do
  	@user = User.create(user_attributes)

  	expect(@user.full_name).to eq(@user.first_name + ' ' + @user.last_name)
  end

  it "deleting user deletes linked commemts" do
    @user = User.create(user_attributes)
    @blog = Blog.create(blog_attributes({ user_id: @user.id }))
    @blog.comments.create(comment_attributes({ user_id: @user.id  }))

    expect {
        @user.destroy
      }.to change(Comment, :count).by(-1)

  end

  it  "deleting user deletes linked blogs" do
    @user = User.create(user_attributes)
    @blog = Blog.create(blog_attributes({ user_id: @user.id }))

    expect {
        @user.destroy
      }.to change(Blog, :count).by(-1)
  end

end
