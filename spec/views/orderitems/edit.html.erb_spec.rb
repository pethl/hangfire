require 'spec_helper'

describe "orderitems/edit" do
  before(:each) do
    @orderitem = assign(:orderitem, stub_model(Orderitem,
      :order_id => 1,
      :saleproduct_id => 1,
      :quantity => 1,
      :item_price => "9.99",
      :total_price => "9.99"
    ))
  end

  it "renders the edit orderitem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orderitem_path(@orderitem), "post" do
      assert_select "input#orderitem_order_id[name=?]", "orderitem[order_id]"
      assert_select "input#orderitem_saleproduct_id[name=?]", "orderitem[saleproduct_id]"
      assert_select "input#orderitem_quantity[name=?]", "orderitem[quantity]"
      assert_select "input#orderitem_item_price[name=?]", "orderitem[item_price]"
      assert_select "input#orderitem_total_price[name=?]", "orderitem[total_price]"
    end
  end
end
