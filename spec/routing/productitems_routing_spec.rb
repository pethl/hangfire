require "spec_helper"

describe ProductitemsController do
  describe "routing" do

    it "routes to #index" do
      get("/productitems").should route_to("productitems#index")
    end

    it "routes to #new" do
      get("/productitems/new").should route_to("productitems#new")
    end

    it "routes to #show" do
      get("/productitems/1").should route_to("productitems#show", :id => "1")
    end

    it "routes to #edit" do
      get("/productitems/1/edit").should route_to("productitems#edit", :id => "1")
    end

    it "routes to #create" do
      post("/productitems").should route_to("productitems#create")
    end

    it "routes to #update" do
      put("/productitems/1").should route_to("productitems#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/productitems/1").should route_to("productitems#destroy", :id => "1")
    end

  end
end
