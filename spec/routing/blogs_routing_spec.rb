

require "rails_helper"

RSpec.describe BlogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/Blogs").to route_to("Blogs#index")
    end

    it "routes to #new" do
      expect(:get => "/Blogs/new").to route_to("Blogs#new")
    end

    it "routes to #show" do
      expect(:get => "/Blogs/1").to route_to("Blogs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/Blogs/1/edit").to route_to("Blogs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/Blogs").to route_to("Blogs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/Blogs/1").to route_to("Blogs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/Blogs/1").to route_to("Blogs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/Blogs/1").to route_to("Blogs#destroy", :id => "1")
    end

  end
end
