require "spec_helper"

describe EventplannersController do
  describe "routing" do

    it "routes to #index" do
      get("/eventplanners").should route_to("eventplanners#index")
    end

    it "routes to #new" do
      get("/eventplanners/new").should route_to("eventplanners#new")
    end

    it "routes to #show" do
      get("/eventplanners/1").should route_to("eventplanners#show", :id => "1")
    end

    it "routes to #edit" do
      get("/eventplanners/1/edit").should route_to("eventplanners#edit", :id => "1")
    end

    it "routes to #create" do
      post("/eventplanners").should route_to("eventplanners#create")
    end

    it "routes to #update" do
      put("/eventplanners/1").should route_to("eventplanners#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/eventplanners/1").should route_to("eventplanners#destroy", :id => "1")
    end

  end
end
