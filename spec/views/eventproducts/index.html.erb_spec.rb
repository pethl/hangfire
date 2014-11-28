require 'spec_helper'

describe "eventproducts/index" do
  before(:each) do
    assign(:eventproducts, [
      stub_model(Eventproduct,
        :eventplanner_id => 1,
        :product_id => 2,
        :covers => 3,
        :over_ride_price => "9.99"
      ),
      stub_model(Eventproduct,
        :eventplanner_id => 1,
        :product_id => 2,
        :covers => 3,
        :over_ride_price => "9.99"
      )
    ])
  end

  it "renders a list of eventproducts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
