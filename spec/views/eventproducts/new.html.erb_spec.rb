require 'spec_helper'

describe "eventproducts/new" do
  before(:each) do
    assign(:eventproduct, stub_model(Eventproduct,
      :eventplanner_id => 1,
      :product_id => 1,
      :covers => 1,
      :over_ride_price => "9.99"
    ).as_new_record)
  end

  it "renders new eventproduct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", eventproducts_path, "post" do
      assert_select "input#eventproduct_eventplanner_id[name=?]", "eventproduct[eventplanner_id]"
      assert_select "input#eventproduct_product_id[name=?]", "eventproduct[product_id]"
      assert_select "input#eventproduct_covers[name=?]", "eventproduct[covers]"
      assert_select "input#eventproduct_over_ride_price[name=?]", "eventproduct[over_ride_price]"
    end
  end
end
