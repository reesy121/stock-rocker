require 'rails_helper'

RSpec.describe Blog, type: :model do

  before  do
  	@user = User.create!(user_attributes)
  end

  context "presence of model attributes" do 

	  before  do
   		 @blog = Blog.new({ title: "", sub_title: "", tags: "", posts_attributes:{ ""=> { content: "" } } })
  	  end

	  it "title must be present" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:title].any?).to eq(true)
	  end

	  it "tags must be present" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:tags].any?).to eq(true)
	  end

	   it "post(s) must be present" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:posts].any?).to eq(true)
	  end

	  it "user must be present" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:user].any?).to eq(true)
	  end

	  it "categorizations must be present" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:categorizations].any?).to eq(true)
	  end

	  it "sub title can be blank" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:sub_title].any?).to eq(false)
	  end
  end

   context "Minimum lengths of attributes string" do

   	before do
   		 @blog = Blog.new({ title: "a" * 4,  tags: "a" * 4 }, 
   		 					posts_attributes: {"0"=>{"content"=>"a" * 19, "_destroy"=>"false" } })
  	end

   	it "title has to be minimum of 5 characters" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:title].any?).to eq(true)
	  end

	it "tags have to be minimum of 5 characters" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:tags].any?).to eq(true)
	  end

	 it "post content validation is accessed through blog" do
	 	@blog.valid?

	 	expect(@blog.errors[:posts].any?).to eq(true)
	 end
   end 

   context "Maximum lengths of attribute string" do

   	before do
   		 @blog = Blog.new({ title: "a" * 56, sub_title: "a" * 56,  tags: "a" * 121 })
  	end

   	it "title has to be maximum of 55 characters" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:title].any?).to eq(true)
	  end

	 it "sub title has to be maximum of 55 characters" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:sub_title].any?).to eq(true)
	  end

	it "tags have to be minimum of 120 characters" do
	    @blog.valid?  # populates errors

	  	expect(@blog.errors[:tags].any?).to eq(true)
	  end
   end

   context "Valid blog" do

   	before do
   		@blog = Blog.new(blog_attributes(user_id: @user.id))
  	end

  	it "to be valid" do
	    expect(@blog.valid?).to be true
	end

  end

  it "more than 5 post attributes on a blog post to error" do
  	expect{ Blog.new(blog_6_post_attributes) }.to raise_exception(ActiveRecord::NestedAttributes::TooManyRecords)
  end
  
  context "destroy" do 

  		before do
   			@blog = Blog.create!(blog_attributes(user_id: @user.id))
  		end

	  it "removes associated comments" do
		   @blog.comments.create!(comment_attributes(user_id: @user.id))

		  expect {
		    @blog.destroy
		  }.to change(Comment, :count).by(-1)
		end

		it "removes associated posts" do

		  expect {
		    @blog.destroy
		  }.to change(Post, :count).by(-1)
		end

		it "removes associated categorizations" do
		  expect {
		    @blog.destroy
		  }.to change(Categorization, :count).by(-1)
		end
	end


	it "accepts nested attributes for categories" do

		@blog = Blog.new(blog_attributes(user_id: @user.id, categorizations_attributes: { "1464726824898"=> { category_attributes: { name: "Teeqia"}, _destroy: "false"}}))

		expect {
			@blog.save
		}.to change(Category, :count).by(1)
	end

	it "views are measured by unique IP address" do
		@blog = Blog.create!(blog_attributes(user_id: @user.id))
		3.times { Impression.create!(impressionist_attributes( { impressionable_id: @blog.id } ) ) }
		expect(@blog.unique_views).to eq(1)
	end
end
