require 'spec_helper'

describe "eventplates/index" do
  before(:each) do
    assign(:eventplates, [
      stub_model(Eventplate,
        :eventplanner_id => 1,
        :plate_id => 2,
        :covers => 3,
        :over_ride_price => "9.99"
      ),
      stub_model(Eventplate,
        :eventplanner_id => 1,
        :plate_id => 2,
        :covers => 3,
        :over_ride_price => "9.99"
      )
    ])
  end

  it "renders a list of eventplates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
