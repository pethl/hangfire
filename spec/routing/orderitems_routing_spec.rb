require "spec_helper"

describe OrderitemsController do
  describe "routing" do

    it "routes to #index" do
      get("/orderitems").should route_to("orderitems#index")
    end

    it "routes to #new" do
      get("/orderitems/new").should route_to("orderitems#new")
    end

    it "routes to #show" do
      get("/orderitems/1").should route_to("orderitems#show", :id => "1")
    end

    it "routes to #edit" do
      get("/orderitems/1/edit").should route_to("orderitems#edit", :id => "1")
    end

    it "routes to #create" do
      post("/orderitems").should route_to("orderitems#create")
    end

    it "routes to #update" do
      put("/orderitems/1").should route_to("orderitems#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/orderitems/1").should route_to("orderitems#destroy", :id => "1")
    end

  end
end
