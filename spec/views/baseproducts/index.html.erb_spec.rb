require 'spec_helper'

describe "baseproducts/index" do
  before(:each) do
    assign(:baseproducts, [
      stub_model(Baseproduct,
        :name => "Name",
        :unit_weight => "9.99",
        :total_weight => "9.99",
        :unit_count => "9.99",
        :total_price => "9.99",
        :unit_price => "9.99",
        :price_per => "9.99"
      ),
      stub_model(Baseproduct,
        :name => "Name",
        :unit_weight => "9.99",
        :total_weight => "9.99",
        :unit_count => "9.99",
        :total_price => "9.99",
        :unit_price => "9.99",
        :price_per => "9.99"
      )
    ])
  end

  it "renders a list of baseproducts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
