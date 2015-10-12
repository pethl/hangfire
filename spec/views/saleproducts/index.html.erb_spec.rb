require 'spec_helper'

describe "saleproducts/index" do
  before(:each) do
    assign(:saleproducts, [
      stub_model(Saleproduct,
        :name => "Name",
        :stock_quantity => 1,
        :remaining_quanity => 2,
        :price => "9.99",
        :weight => "Weight",
        :category_id => 3
      ),
      stub_model(Saleproduct,
        :name => "Name",
        :stock_quantity => 1,
        :remaining_quanity => 2,
        :price => "9.99",
        :weight => "Weight",
        :category_id => 3
      )
    ])
  end

  it "renders a list of saleproducts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Weight".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
