require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  before do
    @user = User.create!(user_attributes)
    @song = Song.create!(song_attributes)
  end

  context "when not signed in" do

    it "cannot access create" do
      post :create
      expect(response).to redirect_to root_url
    end

    it "cannot access destroy" do
     delete :destroy, id: @song
     expect(response).to redirect_to root_url
    end
 
    it "cannot access" do
      get :index
      expect(response).to redirect_to root_url
    end
  end
end
