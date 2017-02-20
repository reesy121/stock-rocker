require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with example attributes" do
    user = User.new(user_attributes)

    expect(user.valid?).to eq(true)
  end

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

  it "requires a unique, case insensitive email address" do
    user1 = User.create!(user_attributes)

    user2 = User.new(email: user1.email.upcase)
    user2.valid?
    expect(user2.errors[:email].first).to eq("has already been taken")
  end

  it "accepts properly formatted email addresses" do
    emails = %w[user@example.com first.last@example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it "admin defaults to false" do
    user = User.create!(user_attributes)

    expect(user.admin).to eq(false)
  end

  it "requires a password" do
    user = User.new(password: "")

    user.valid?

    expect(user.errors[:password].any?).to eq(true)
  end

  it "requires password length to be at least 8 characters" do
    user = User.new(password: "a" * 7)

    user.valid?

    expect(user.errors[:password].any?).to eq(true)
  end

  it "requires a password confirmation when a password is present" do
    user = User.new(password: "secret1234", password_confirmation: "")

    user.valid?

    expect(user.errors[:password_confirmation].any?).to eq(true)
  end

  it "password when present must match password_confirmation" do
    user = User.new(user_attributes({ password_confirmation: "notthesamepassword"}) )

    user.valid?

    expect(user.errors[:password_confirmation].any?).to eq(true)
  end

  it "converts email into lowercase before saving" do
    user1 = User.new(user_attributes(email: "WHAY@HOTMAIL.CO.UK"))
    user1.save

    expect(user1.email).to eq("whay@hotmail.co.uk")
  end

  it "automatically encrypts the password into the encrypted_password attribute" do
    user = User.new(password: "secret1234")

    expect(user.encrypted_password.present?).to eq(true)
  end

  it "full name collates first and last name" do
  	user = User.create!(user_attributes)

  	expect(user.full_name).to eq(user.first_name + ' ' + user.last_name)
  end

  it "destroy removes linked commemts" do
    user = User.create!(user_attributes)
    blog = Blog.create!(blog_attributes({ user_id: user.id }))
    blog.comments.create(comment_attributes({ user_id: user.id  }))

    expect {
        user.destroy
      }.to change(Comment, :count).by(-1)

  end

  it  "destroy removes linked blogs" do
    user = User.create!(user_attributes)
    blog = Blog.create!(blog_attributes({ user_id: user.id }))

    expect {
        user.destroy
      }.to change(Blog, :count).by(-1)
  end

  it "all except returns all users bar the current user" do
    current_user = User.create!(user_attributes)
    user = User.create!(user_attributes(email: "drees44@hotmail.com"))
    user1 = User.create!(user_attributes(email: "donedirtcheap@deeds.com"))
    expect(User.all_except(current_user)).not_to include(current_user) 
     expect(User.all_except(current_user)).to include(user) 
  end

end

describe "authenticate" do

  before do
    @user = User.create!(user_attributes)
  end

  it 'accepts correct password' do
    expect(@user.valid_password?(@user.password)).to eq(true)
  end

  #it 'accepts correct email' do
  #  expect(@user.valid_email?(@user.email)).to eq(true)
  #end

end
