require 'spec_helper'

describe "baseproducts/show" do
  before(:each) do
    @baseproduct = assign(:baseproduct, stub_model(Baseproduct,
      :name => "Name",
      :unit_weight => "9.99",
      :total_weight => "9.99",
      :unit_count => "9.99",
      :total_price => "9.99",
      :unit_price => "9.99",
      :price_per => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
