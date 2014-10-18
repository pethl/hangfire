require 'spec_helper'

describe "Baseproducts" do
  describe "GET /baseproducts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get baseproducts_path
      response.status.should be(200)
    end
  end
end
