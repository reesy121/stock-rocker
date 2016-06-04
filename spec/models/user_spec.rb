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

  it "email must be unique"

  it "passwords must match"

  it "full name method collates first and last name" do
  	@user = User.create(user_attributes)

  	expect(@user.full_name).to eq(@user.first_name + ' ' + @user.last_name)
  end

  it "deleting user deletes linked commemts"

  it  "deleting user deletes linked blogs"

end
