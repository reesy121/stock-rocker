require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  describe "No logged in user" do

    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "GET show returns http success" do
      blog = Blog.create(blog_attributes)
      get :show, { id: blog.id }
      expect(response).to have_http_status(:success)
    end

    it "POST new redirect when not logged in" do
      blog = Blog.create(blog_attributes)
      post :new#, blog 
      expect(response).to redirect_to new_user_registration_path
    end

    it "POST new redirect when not logged in" do
      get :new
      expect(response).to redirect_to new_user_registration_path
    end

    it "GET edit redirects when not logged in" do
      blog = Blog.create(blog_attributes)
      get :edit, { id: blog.id }
      expect(response).to redirect_to new_user_registration_path
    end

    it "POST edit redirects when not logged in" do
      blog = Blog.create(blog_attributes)
      patch :edit, { id: blog.id }
      expect(response).to redirect_to new_user_registration_path
    end

    it "DELETE redirects when not logged in"

  end

    #it "POST comments redirects when not logged in" #Not valid?


    describe "Login normal user" do
      #Create login functionality with devise using 
      #https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-(and-RSpec)
    end

    describe "Login admin user" do


    end


end
