require 'rails_helper'

RSpec.describe BlogsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all blog as @blogs" do
      post = Blog.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:blogs)).to eq([blog])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @blog" do
      post = Blog.create! valid_attributes
      get :show, {:id => post.to_param}, valid_session
      expect(assigns(:blog)).to eq(blog)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, {}, valid_session
      expect(assigns(:blog)).to be_a_new(blog)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      post = Blog.create! valid_attributes
      get :edit, {:id => post.to_param}, valid_session
      expect(assigns(:blog)).to eq(blog)
    end
  end

  describe "Blog #create" do
    context "with valid params" do
      it "creates a new blog" do
        expect {
          blog :create, {:blog => valid_attributes}, valid_session
        }.to change(Blog, :count).by(1)
      end

      it "assigns a newly created post as @blog" do
        post :create, {:blog => valid_attributes}, valid_session
        expect(assigns(:blog)).to be_a(Post)
        expect(assigns(:blog)).to be_persisted
      end

      it "redirects to the created blog" do
        post :create, {:blog => valid_attributes}, valid_session
        expect(response).to redirect_to(Blog.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, {:post => invalid_attributes}, valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, {:post => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => new_attributes}, valid_session
        post.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested post as @post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => valid_attributes}, valid_session
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => invalid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.create! valid_attributes
        put :update, {:id => post.to_param, :post => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, {:id => post.to_param}, valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, {:id => post.to_param}, valid_session
      expect(response).to redirect_to(posts_url)
    end
  end

end
