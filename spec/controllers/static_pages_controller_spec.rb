require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

    it "Get request for about returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

end
