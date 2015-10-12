require "spec_helper"

describe SaleproductsController do
  describe "routing" do

    it "routes to #index" do
      get("/saleproducts").should route_to("saleproducts#index")
    end

    it "routes to #new" do
      get("/saleproducts/new").should route_to("saleproducts#new")
    end

    it "routes to #show" do
      get("/saleproducts/1").should route_to("saleproducts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/saleproducts/1/edit").should route_to("saleproducts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/saleproducts").should route_to("saleproducts#create")
    end

    it "routes to #update" do
      put("/saleproducts/1").should route_to("saleproducts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/saleproducts/1").should route_to("saleproducts#destroy", :id => "1")
    end

  end
end
