require "spec_helper"

describe EventplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/eventplates").should route_to("eventplates#index")
    end

    it "routes to #new" do
      get("/eventplates/new").should route_to("eventplates#new")
    end

    it "routes to #show" do
      get("/eventplates/1").should route_to("eventplates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/eventplates/1/edit").should route_to("eventplates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/eventplates").should route_to("eventplates#create")
    end

    it "routes to #update" do
      put("/eventplates/1").should route_to("eventplates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/eventplates/1").should route_to("eventplates#destroy", :id => "1")
    end

  end
end
