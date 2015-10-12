require 'spec_helper'

describe "saleproducts/edit" do
  before(:each) do
    @saleproduct = assign(:saleproduct, stub_model(Saleproduct,
      :name => "MyString",
      :stock_quantity => 1,
      :remaining_quanity => 1,
      :price => "9.99",
      :weight => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit saleproduct form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", saleproduct_path(@saleproduct), "post" do
      assert_select "input#saleproduct_name[name=?]", "saleproduct[name]"
      assert_select "input#saleproduct_stock_quantity[name=?]", "saleproduct[stock_quantity]"
      assert_select "input#saleproduct_remaining_quanity[name=?]", "saleproduct[remaining_quanity]"
      assert_select "input#saleproduct_price[name=?]", "saleproduct[price]"
      assert_select "input#saleproduct_weight[name=?]", "saleproduct[weight]"
      assert_select "input#saleproduct_category_id[name=?]", "saleproduct[category_id]"
    end
  end
end
