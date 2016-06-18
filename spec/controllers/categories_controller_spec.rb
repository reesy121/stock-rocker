require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
	describe "Category Controller" do
    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "GET show returns http success" do
      get :show,  {id: 1 }
      expect(response).to have_http_status(:success)
    end
  end
end
