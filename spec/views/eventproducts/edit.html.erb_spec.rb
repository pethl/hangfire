require 'spec_helper'

describe "eventproducts/edit" do
  before(:each) do
    @eventproduct = assign(:eventproduct, stub_model(Eventproduct,
      :eventplanner_id => 1,
      :product_id => 1,
      :covers => 1,
      :over_ride_price => "9.99"
    ))
  end

  it "renders the edit eventproduct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", eventproduct_path(@eventproduct), "post" do
      assert_select "input#eventproduct_eventplanner_id[name=?]", "eventproduct[eventplanner_id]"
      assert_select "input#eventproduct_product_id[name=?]", "eventproduct[product_id]"
      assert_select "input#eventproduct_covers[name=?]", "eventproduct[covers]"
      assert_select "input#eventproduct_over_ride_price[name=?]", "eventproduct[over_ride_price]"
    end
  end
end
