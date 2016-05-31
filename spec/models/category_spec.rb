require 'rails_helper'

RSpec.describe Category, type: :model do
  it "name must be present" do
  	@category = Category.new()

  	@category.valid?  # populates errors

	expect(@category.errors[:name].any?).to eq(true)
  end

  it "name cannot be longer than 55 characters" do
  	@category = Category.new(name: "a" * 56)

  	@category.valid?  # populates errors

	expect(@category.errors[:name].any?).to eq(true)
  end

  it "name has to be unique unique" do
  	name = "Have Love"
  	@category = Category.create(name: name)
  	@category1 = Category.new(name: name.upcase)

  	@category1.valid?  # populates errors

	expect(@category1.errors[:name].any?).to eq(true)
  end

  it "name is capitalised when created" do
  	name = "have love"
  	@category = Category.create(name: name)

	expect(@category.name).to eq(name.titlecase)
  end
end
