require 'rails_helper'

RSpec.describe Category, type: :model do
  
  it "name must be present" do
  	category = Category.new()

  	category.valid?  # populates errors

	  expect(category.errors[:name].any?).to eq(true)
  end

  it "name cannot be longer than 55 characters" do
  	category = Category.new(name: "a" * 56)

  	category.valid?  # populates errors

	  expect(category.errors[:name].any?).to eq(true)
  end

  it "name has to be unique" do
  	category = Category.create!(name: "Have Love")
  	category1 = Category.new(name: "HAVE LOVE")

  	category1.valid?  # populates errors

	  expect(category1.errors[:name].any?).to eq(true)
  end

  it "name is capitalised when created" do
  	category = Category.create!(name: "all lower case")

	  expect(category.name).to eq("All Lower Case")
  end
  
end
