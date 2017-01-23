require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

    it "get returns http success" do
      get :new
      
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      post :create, {:contact => contact_attributes}

      expect(response).to have_http_status(:success)
    end

end
