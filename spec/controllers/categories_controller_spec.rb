require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

    before do
      @category = Category.create!(category_attributes)
    end

    it "index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "show returns http success" do
      get :show,  { id: @category }
      expect(response).to have_http_status(:success)
    end
end
