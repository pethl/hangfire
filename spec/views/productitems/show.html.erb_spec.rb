require 'spec_helper'

describe "productitems/show" do
  before(:each) do
    @productitem = assign(:productitem, stub_model(Productitem,
      :product_id => 1,
      :ingredient_id => 2,
      :volume => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
  end
end
