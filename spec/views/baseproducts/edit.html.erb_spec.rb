require 'spec_helper'

describe "baseproducts/edit" do
  before(:each) do
    @baseproduct = assign(:baseproduct, stub_model(Baseproduct,
      :name => "MyString",
      :unit_weight => "9.99",
      :total_weight => "9.99",
      :unit_count => "9.99",
      :total_price => "9.99",
      :unit_price => "9.99",
      :price_per => "9.99"
    ))
  end

  it "renders the edit baseproduct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", baseproduct_path(@baseproduct), "post" do
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
