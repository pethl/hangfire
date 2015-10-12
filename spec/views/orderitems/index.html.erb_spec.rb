require 'spec_helper'

describe "orderitems/index" do
  before(:each) do
    assign(:orderitems, [
      stub_model(Orderitem,
        :order_id => 1,
        :saleproduct_id => 2,
        :quantity => 3,
        :item_price => "9.99",
        :total_price => "9.99"
      ),
      stub_model(Orderitem,
        :order_id => 1,
        :saleproduct_id => 2,
        :quantity => 3,
        :item_price => "9.99",
        :total_price => "9.99"
      )
    ])
  end

  it "renders a list of orderitems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
