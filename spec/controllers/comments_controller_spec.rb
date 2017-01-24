require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before do
    @user = User.create!(user_attributes)
    @blog = Blog.create!(blog_attributes(user_id: @user.id))
  end

  context "when not logged in" do

  	it "cannot access create" do
  	  post :create, blog_id: @blog

      expect(response).to redirect_to(new_user_session_url)
  	end

  	it "cannot access destroy" do
  	  comment = Comment.create!(comment_attributes(user_id: @user.id, blog_id: @blog.id))
  	  delete :destroy, blog_id: @blog, id: comment

      expect(response).to redirect_to(new_user_session_url)
  	end


  end

end
