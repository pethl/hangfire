require "spec_helper"

describe BaseproductsController do
  describe "routing" do

    it "routes to #index" do
      get("/baseproducts").should route_to("baseproducts#index")
    end

    it "routes to #new" do
      get("/baseproducts/new").should route_to("baseproducts#new")
    end

    it "routes to #show" do
      get("/baseproducts/1").should route_to("baseproducts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/baseproducts/1/edit").should route_to("baseproducts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/baseproducts").should route_to("baseproducts#create")
    end

    it "routes to #update" do
      put("/baseproducts/1").should route_to("baseproducts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/baseproducts/1").should route_to("baseproducts#destroy", :id => "1")
    end

  end
end
