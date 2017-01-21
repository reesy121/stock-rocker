require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  before do
    @user = User.create!(user_attributes)
    @blog = Blog.create!(blog_attributes(user_id: @user.id))
  end

 context "when not signed in" do

  it "cannot access new" do
    get :new

    expect(response).to redirect_to(new_user_registration_url)
  end

  it "cannot access create" do
    post :create

    expect(response).to redirect_to(new_user_registration_url)
  end

  it "cannot access edit" do
    get :edit, id: @blog

    expect(response).to redirect_to(new_user_registration_url)
  end

  it "cannot access update" do
    patch :update, id: @blog

    expect(response).to redirect_to(new_user_registration_url)
  end

  it "cannot access destroy" do
     delete :destroy, id: @blog

     expect(response).to redirect_to(new_user_registration_url)
  end


 end

end
