require 'spec_helper'

describe "eventplates/edit" do
  before(:each) do
    @eventplate = assign(:eventplate, stub_model(Eventplate,
      :eventplanner_id => 1,
      :plate_id => 1,
      :covers => 1,
      :over_ride_price => "9.99"
    ))
  end

  it "renders the edit eventplate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", eventplate_path(@eventplate), "post" do
      assert_select "input#eventplate_eventplanner_id[name=?]", "eventplate[eventplanner_id]"
      assert_select "input#eventplate_plate_id[name=?]", "eventplate[plate_id]"
      assert_select "input#eventplate_covers[name=?]", "eventplate[covers]"
      assert_select "input#eventplate_over_ride_price[name=?]", "eventplate[over_ride_price]"
    end
  end
end
