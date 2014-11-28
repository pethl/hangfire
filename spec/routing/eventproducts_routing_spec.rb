require "spec_helper"

describe EventproductsController do
  describe "routing" do

    it "routes to #index" do
      get("/eventproducts").should route_to("eventproducts#index")
    end

    it "routes to #new" do
      get("/eventproducts/new").should route_to("eventproducts#new")
    end

    it "routes to #show" do
      get("/eventproducts/1").should route_to("eventproducts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/eventproducts/1/edit").should route_to("eventproducts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/eventproducts").should route_to("eventproducts#create")
    end

    it "routes to #update" do
      put("/eventproducts/1").should route_to("eventproducts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/eventproducts/1").should route_to("eventproducts#destroy", :id => "1")
    end

  end
end
