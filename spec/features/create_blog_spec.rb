require 'rails_helper'

describe "Creating a new blog", js: true do
	# need admin user to create blog
	before do
		@user = User.create!(user_attributes(admin: true))
		@category = Category.create!(name: "Rock 'n' Roll")
		sign_in(@user)
	end

	it "with valid details saves and loads the blog" do

		visit new_blog_path

		expect(current_path).to eq(new_blog_path)

		fill_in "Title", with: "Test Blog Baby!"
		fill_in "Sub title", with: "Tell Me Baby"
		click_link 'Insert New Category', match: :first
		expect(page).to have_text("Name")
		fill_in "Name", with: "Adventure"
		
		# Test add another category that is not there previously 
		click_link "Add Blog Category"
		select @category.name, from: "Category"

		fill_in "Tags", with: "Rock Roll Life Tidy"

		# Test writing post
		fill_in_ckeditor 'Content', with: "This is the wrong content baby!!!"
		click_on "Remove Post"
		click_on "Add Post Section"
		fill_in_ckeditor 'Content', with: "This is the right content baby!!!!"

		# Put in test to load a picture into db

		click_on "Create Blog"

		expect(current_path).to eq(blog_path(Blog.last))
		expect(page).to have_text("Blog was successfully created")
		expect(page).to have_text("Test Blog Baby")
		expect(page).to have_text("Tell Me Baby")
		expect(page).to have_text("This is the right content baby!!!!")
	end

	it "with invalid details doesn't save" do
		visit new_blog_path
    
	    expect { 
	      click_on 'Create Blog' 
	    }.not_to change(Blog, :count)
	    
	    expect(current_path).to eq(blogs_path)   
	    expect(page).to have_text('error')
	end

	it "a preview button views the blog without saving it" do
		visit new_blog_path

		fill_in "Title", with: "Test Blog Baby!"
		fill_in "Sub title", with: "Tell Me Baby"
		select @category.name, from: "Category"
		fill_in "Tags", with: "Meta Data Baby Why Don't You Love Me"
		fill_in_ckeditor 'Content', with: "This is the right content baby!!!!"

		expect { 
	      find('input[name="preview_button"]').click
	    }.not_to change(Blog, :count)
	    expect(page).to have_text("Posted on")

	    fill_in "Title", with: "Changing from Preview page"

	    # Just check blog can be saved from previewing it
	    click_on 'Create Blog'
	    expect(current_path).to eq(blog_path(Blog.last))
		expect(page).to have_text("Blog was successfully created")
	end


end