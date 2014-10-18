require 'spec_helper'

describe "baseproducts/new" do
  before(:each) do
    assign(:baseproduct, stub_model(Baseproduct,
      :name => "MyString",
      :unit_weight => "9.99",
      :total_weight => "9.99",
      :unit_count => "9.99",
      :total_price => "9.99",
      :unit_price => "9.99",
      :price_per => "9.99"
    ).as_new_record)
  end

  it "renders new baseproduct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", baseproducts_path, "post" do
      assert_select "input#baseproduct_name[name=?]", "baseproduct[name]"
      assert_select "input#baseproduct_unit_weight[name=?]", "baseproduct[unit_weight]"
      assert_select "input#baseproduct_total_weight[name=?]", "baseproduct[total_weight]"
      assert_select "input#baseproduct_unit_count[name=?]", "baseproduct[unit_count]"
      assert_select "input#baseproduct_total_price[name=?]", "baseproduct[total_price]"
      assert_select "input#baseproduct_unit_price[name=?]", "baseproduct[unit_price]"
      assert_select "input#baseproduct_price_per[name=?]", "baseproduct[price_per]"
    end
  end
end
