require 'rails_helper'

RSpec.describe Post, type: :model do
  context "Post Validation" do
   	before :all do
   		 @post = Post.new({ content: "a" * 19 })
  	end

   	it "content has to be minimum of 20 characters" do
	    @post.valid?  # populates errors

	  	expect(@post.errors[:content].any?).to eq(true)
	end

	it "blog link must be present" do
	    @post.valid?  # populates errors

	  	expect(@post.errors[:blog].any?).to eq(true)
	end

	it "content must be present" do
		@post.content = nil
	    @post.valid?  # populates errors

	  	expect(@post.errors[:content].any?).to eq(true)
	end
  end
end
