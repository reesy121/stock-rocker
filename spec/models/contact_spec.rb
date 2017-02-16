require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "name must be present" do
  	@contact = Contact.new(name: "")

  	@contact.valid? #populates errors

  	expect(@contact.errors[:name].any?).to eq(true)
  end

  it "message must be present" do
  	@contact = Contact.new(message: "")

  	@contact.valid? #populates errors

  	expect(@contact.errors[:message].any?).to eq(true)
  end

  it "name must be max 50 characters" do
  	@contact = Contact.new(name: "a" * 55)

  	@contact.valid? #populates errors

  	expect(@contact.errors[:name].any?).to eq(true)
  end

  it "message must be max 255 characters" do
  	@contact = Contact.new(message: "")

  	@contact.valid? #populates errors

  	expect(@contact.errors[:message].any?).to eq(true)
  end

  it "email must be present" do
  	@contact = Contact.new(email: "")

  	@contact.valid? #populates errors

  	expect(@contact.errors[:email].any?).to eq(true)
  end

  it "email validation rejects invalid addresses" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com]
  	invalid_addresses.each do |email|
  		@contact = Contact.new(email: email)

  		@contact.valid? #populates errors

  		expect(@contact.errors[:email].any?).to eq(true)
  	end
  end

  it "email validation accepted valid addresses" do
  	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.o
        first.last@foo.jp alice+bob@baz.cn]
  	valid_addresses.each do |email|
  		@contact = Contact.new(email: email)

  		@contact.valid? #populates errors

  		expect(@contact.errors[:email].any?).to eq(false)
  	end
  end

  it "email must be max 120 characters" do
  	@contact = Contact.new(email: "a" * 120 + '@toolong.com')

  	@contact.valid? #populates errors

  	expect(@contact.errors[:email].any?).to eq(true)
  end
S
end
