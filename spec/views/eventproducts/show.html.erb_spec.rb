require 'spec_helper'

describe "eventproducts/show" do
  before(:each) do
    @eventproduct = assign(:eventproduct, stub_model(Eventproduct,
      :eventplanner_id => 1,
      :product_id => 2,
      :covers => 3,
      :over_ride_price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
  end
end
