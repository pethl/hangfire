require 'spec_helper'

describe "saleproducts/show" do
  before(:each) do
    @saleproduct = assign(:saleproduct, stub_model(Saleproduct,
      :name => "Name",
      :stock_quantity => 1,
      :remaining_quanity => 2,
      :price => "9.99",
      :weight => "Weight",
      :category_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
    rendered.should match(/Weight/)
    rendered.should match(/3/)
  end
end
