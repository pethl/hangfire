require 'spec_helper'

describe "orderitems/show" do
  before(:each) do
    @orderitem = assign(:orderitem, stub_model(Orderitem,
      :order_id => 1,
      :saleproduct_id => 2,
      :quantity => 3,
      :item_price => "9.99",
      :total_price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
